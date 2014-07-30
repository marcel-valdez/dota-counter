require_relative 'hero'

class Matchup
  attr_reader :hero, :against, :winrate
  def initialize(hero, against, winrate)
    if hero.is_a? Hero
      @hero = hero.name
    else
      @hero = hero
    end

    if against.is_a? Hero
      @against = against.name
    else
      @against = against
    end

    @winrate = winrate
  end

  def to_s
    '{' +
      'hero: "' + hero + '",' +
      'against: "' + against + '",' +
      'winrate: ' + winrate.to_s +
    '}'
  end
end