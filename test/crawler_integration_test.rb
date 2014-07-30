require 'test/unit'
require 'anemone'
require_relative '../lib/crawler'
require_relative '../lib/hero'
require_relative '../lib/matchup'

class CrawlerIntegrationTest < Test::Unit::TestCase

  def test_crawl
    # omit('slow')
    # Arrange
    target = Crawler.new(true)
    # Load
    target.load_heroes
    matchup = target.get_matchup('abaddon', 'enigma')
    # Assert
    assert_equal Hero.get_heroes('abaddon').first.name, matchup.hero
    assert_equal Hero.get_heroes('enigma').first.name, matchup.against
    assert_not_nil matchup.winrate
  end
end