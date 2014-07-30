require 'test/unit'
require 'anemone'
require_relative '../lib/crawler'

class CrawlerTest < Test::Unit::TestCase

  def test_get_matchups
    omit('temp')
    # arrange
    target = Crawler.new
    page = get_page('http://dotabuff.com/heroes/drow-ranger/matchups')
    # act
    actual = target.get_matchups(page)
    # assert
    assert_not_nil actual
    assert_equal actual.count, Hero.all_heroes.count() -1
  end

  def test_get_matchups_hero
    omit('temp')
    # arrange
    target = Crawler.new
    page = get_page('http://dotabuff.com/heroes/drow-ranger/matchups')
    # act
    actual = target.get_matchups_hero(page)
    # assert
    assert_not_nil actual
    assert_equal 'Drow Ranger', actual.name
  end

  def get_page(url)
    Anemone.crawl(url) do |anemone|
      anemone.focus_crawl do |page|
        return page
      end
    end
  end
end