require 'anemone'
require_relative 'hero'

class Crawler
  MATCHUPS_REGX = /.*\/heroes\/.*\/matchups/
  HEROES_REGX = /.*\/heroes\/[a-zA-Z-]+$/

  def initialize(one_hero = false)
    @one_hero = one_hero
  end

  def load_heroes
    Hero.all_heroes.each do |hero|
      matchups_url = "http://dotabuff.com/heroes/#{hero.uri_part}/matchups"
      Anemone.crawl(matchups_url) do |anemone|
        anemone.focus_crawl do |matchups_page|
          puts "\nReading matchups on page: #{matchups_page.url}"
          matchups = get_matchups(matchups_page)
          hero = get_matchups_hero(matchups_page)
          matchups.each { |matchup| hero.add_matchup(matchup[:hero], matchup[:winrate]) }
          []
        end
      end

      return nil if @one_hero
    end
  end

  # Assume strings
  def get_best_counter(countered_heroes)
    counters = []
    scores = {}
    # Get the best 20 counters for each hero
    countered_heroes.each do |hero|
      hero.get_worst_matchups().take(20).each do |matchup|
        counters << Hero.get_heroes(matchup.against).first
      end
    end

    # Remove duplicates
    counters.uniq!

    # Add up winrate of counters against all countering heros
    counters.each do |hero_counter|
      countered_heroes.each do |hero_countered|
        scores[hero_counter] = 0 if scores[hero_counter].nil?

        unless hero_countered.eql? hero_counter
          matchup = hero_counter.get_matchup(hero_countered)
          if matchup.nil?
            raise "Nil matchup found for matchup: #{hero_countered.name} vs #{hero_counter.name}"
          end
          scores[hero_counter] += hero_counter.get_matchup(hero_countered).winrate
        end
      end
    end

    # Sort counters by their winrate
    result = scores.sort_by { |hero, winrate| winrate }

    # Take the best 20
    result.take(20)
  end

  def get_matchup(hero, against)
    hero_obj = Hero.get_heroes(hero).first
    against_obj = Hero.get_heroes(against).first
    hero_obj.get_matchup(against_obj)
  end

  def get_matchups_hero(matchups_page)
    title = matchups_page.doc.at_css('.content-header-title h1').text
    subtitle = matchups_page.doc.at_css('.content-header-title h1 small').text
    Hero.get_heroes(title.gsub(subtitle, '')).first
  end

  def get_matchups(page)
    page.doc.xpath('//section/article/table/tbody/tr').
         collect { |matchup| convert_matchup(matchup) }.
         sort_by { |matchup| matchup[:winrate] }
  end

  def convert_matchup(matchup_html)
    hero_name = matchup_html.css('.hero-link').text
    hero = Hero.get_heroes(hero_name).first
    winrate = matchup_html.xpath('td')[2].text[0...-1].to_f
     { :hero => hero, winrate: winrate }
  end
end