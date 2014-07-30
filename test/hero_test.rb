require 'test/unit'
require_relative '../lib/hero'

class HeroTest < Test::Unit::TestCase
  def test_get_hero
    check_get_hero('Skywrath Mage')
    check_get_hero('Drow Ranger')
    check_get_hero('Centaur Warrunner')
    check_get_hero('Earthshaker')
  end

  def test_get_hero_by_alias
    check_get_hero_by_alias('sky')
    check_get_hero_by_alias('mage')
    check_get_hero_by_alias('drow')
    check_get_hero_by_alias('cent')
    check_get_hero_by_alias('raigor')
    check_get_hero_by_alias('pl')
  end

  def check_get_hero(hero_name)
    actual = Hero.get_heroes(hero_name).first
    assert_not_nil actual
    assert_equal hero_name, actual.name
  end

  def check_get_hero_by_alias(hero_alias)
    begin
      actual = Hero.get_heroes(hero_alias).first
      assert_not_nil actual
      assert_includes actual.aliases, hero_alias
    rescue
      raise 'Failed alias ' + hero_alias
    end
  end

  def test_serialize_heroes
    begin
      # Arrange
      first = Hero.get_heroes('cent').first
      second = Hero.get_heroes('sky').first
      first.add_matchup(second, 1.0)
      # Act
      result = Hero.serialize_heroes
      File.write('serialized', result)
      yaml = File.read('serialized')
      Hero.deserialize_heroes(yaml)
      # Re-run tests
      test_get_hero
      test_get_hero_by_alias
      # Check matchup was stored
      first = Hero.get_heroes('cent').first
      second = Hero.get_heroes('sky').first
      actual_winrate = first.get_matchup(second).winrate
      assert_equal 1.0, actual_winrate
    ensure
      # Cleanup
      File.delete('serialized')
    end
  end
end