require 'yaml'
require_relative 'matchup'

class Hero
  attr_reader :name, :aliases, :uri_part
  def initialize(name, aliases, uri_part)
    @name = name
    @aliases = aliases
    @uri_part = uri_part
    @matchups = []
  end

  @@heroes = [
    Hero.new('Abaddon',  %w(Abaddon abb abby aba abba), 'abaddon'),
    Hero.new('Alchemist', %w(Alchemist alch), 'alchemist'),
    Hero.new('Ancient Apparition',  ['Ancient Apparition', 'aa', 'ancient'], 'ancient-apparition'),
    Hero.new('Anti-Mage',  %w(Anti-Mage am), 'anti-mage'),
    Hero.new('Axe',  %w(Axe), 'axe'),
    Hero.new('Bane',  %w(Bane), 'bane'),
    Hero.new('Batrider',  %w(Batrider bat br), 'batrider'),
    Hero.new('Beastmaster',  %w(Beastmaster bm beast), 'beastmaster'),
    Hero.new('Bloodseeker',  %w(Bloodseeker bs blood), 'bloodseeker'),
    Hero.new('Bounty Hunter',  ['Bounty Hunter', 'bh', 'bounty' ], 'bounty-hunter'),
    Hero.new('Brewmaster',  %w(Brewmaster brew panda), 'brewmaster'),
    Hero.new('Bristleback',  %w(Bristleback bb bristle), 'bristleback'),
    Hero.new('Broodmother',  %w(Broodmother brood spider), 'broodmother'),
    Hero.new('Centaur Warrunner',  ['Centaur Warrunner', 'centaur', 'cent' ], 'centaur-warrunner'),
    Hero.new('Chaos Knight',  ['Chaos Knight', 'ck', 'chaos' ], 'chaos-knight'),
    Hero.new('Chen', %w(Chen), 'chen'),
    Hero.new('Clinkz',  %w(Clinkz clink), 'clinkz'),
    Hero.new('Clockwerk',  %w(Clockwerk clock cw clok), 'clockwerk'),
    Hero.new('Crystal Maiden',  ['Crystal Maiden', 'cm', 'crystal', 'maiden' ], 'crystal-maiden'),
    Hero.new('Dark Seer',  ['Dark Seer', 'ds', 'seer'], 'dark-seer'),
    Hero.new('Dazzle',  %w(Dazzle dazz), 'dazzle'),
    Hero.new('Death Prophet',  ['Death Prophet', 'dp', 'prophet'], 'death-prophet'),
    Hero.new('Disruptor',  %w(Disruptor thrall), 'disruptor'),
    Hero.new('Doom',  %w(Doom), 'doom'),
    Hero.new('Dragon Knight',  ['Dragon Knight', 'dk', 'dragon', 'knight'], 'dragon-knight'),
    Hero.new('Drow Ranger', ['Drow Ranger', 'drow', 'ranger' ], 'drow-ranger'),
    Hero.new('Earth Spirit',  ['Earth Spirit', 'es', 'earth'], 'earthshaker'),
    Hero.new('Earthshaker',  %w(Earthshaker es shaker raigor), 'earth-spirit'),
    Hero.new('Elder Titan',  ['Elder Titan', 'cairne', 'titan', 'elder'], 'elder-titan'),
    Hero.new('Ember Spirit',  ['Ember Spirit', 'es', 'ember'], 'ember-spirit'),
    Hero.new('Enchantress',  %w(Enchantress ench), 'enchantress'),
    Hero.new('Enigma', %w(Enigma enig), 'enigma'),
    Hero.new('Faceless Void',  ['Faceless Void', 'void'], 'faceless-void'),
    Hero.new('Gyrocopter',  %w(Gyrocopter gyro copter), 'gyrocopter'),
    Hero.new('Huskar',  %w(Huskar husk), 'huskar'),
    Hero.new('Invoker',  %w(Invoker inv invok invoke), 'invoker'),
    Hero.new('Io',  %w(Io wisp), 'io'),
    Hero.new('Jakiro',  %w(Jakiro jak jaki), 'jakiro'),
    Hero.new('Juggernaut', %w(Juggernaut jugg), 'juggernaut'),
    Hero.new('Keeper of the Light',  ['Keeper of the Light', 'kotl', 'keeper' ], 'keeper-of-the-light'),
    Hero.new('Kunkka',  %w(Kunkka kunk), 'kunkka'),
    Hero.new('Legion Commander',  ['Legion Commander', 'lc', 'legion'], 'legion-commander'),
    Hero.new('Leshrac',  %w(Leshrac lesh), 'leshrac'),
    Hero.new('Lich',  %w(Lich), 'lich'),
    Hero.new('Lifestealer',  ['Lifestealer', 'naix', "n'aix", 'ls'], 'lifestealer'),
    Hero.new('Lina',  %w(Lina), 'lina'),
    Hero.new('Lion',  %w(Lion), 'lion'),
    Hero.new('Lone Druid',  ['Lone Druid', 'ld', 'bear', 'druid'], 'lone-druid'),
    Hero.new('Luna',  %w(Luna), 'luna'),
    Hero.new('Lycan',  %w(Lycan), 'lycan'),
    Hero.new('Magnus',  %w(Magnus magg maggy mag), 'magnus'),
    Hero.new('Medusa', %w(Medusa), 'medusa'),
    Hero.new('Meepo',  %w(Meepo), 'meepo'),
    Hero.new('Mirana',  %w(Mirana mirana potm priestess), 'mirana'),
    Hero.new('Morphling',  %w(Morphling morph), 'morphling'),
    Hero.new('Naga Siren',  ['Naga Siren', 'naga', 'siren' ], 'naga-siren'),
    Hero.new('Nature\'s Prophet',  ["Nature's Prophet", 'np', 'nature'], 'natures-prophet'),
    Hero.new('Necrophos',  %w(Necrophos necro), 'necrophos'),
    Hero.new('Night Stalker',  ['Night Stalker', 'ns', 'bala' ], 'night-stalker'),
    Hero.new('Nyx Assassin',  ['Nyx Assassin', 'nyx'], 'nyx-assassin'),
    Hero.new('Ogre Magi',  ['Ogre Magi', 'ogre', 'magi' ], 'ogre-magi'),
    Hero.new('Omniknight',  %w(Omniknight omni), 'omniknight'),
    Hero.new('Outworld Devourer',  ['Outworld Devourer', 'od', 'out'], 'outworld-devourer'),
    Hero.new('Phantom Assassin',  ['Phantom Assassin', 'pa' ], 'phantom-assassin'),
    Hero.new('Phantom Lancer',  ['Phantom Lancer', 'pl', 'lancer' ], 'phantom-lancer'),
    Hero.new('Phoenix', %w(Phoenix), 'phoenix'),
    Hero.new('Puck',  %w(Puck), 'puck'),
    Hero.new('Pudge',  %w(Pudge), 'pudge'),
    Hero.new('Pugna',  %w(Pugna pug), 'pugna'),
    Hero.new('Queen of Pain',  ['Queen of Pain', 'qop', 'queen'], 'queen-of-pain'),
    Hero.new('Razor', %w(Razor), 'razor'),
    Hero.new('Riki',  %w(Riki rikimaru), 'riki'),
    Hero.new('Rubick',  %w(Rubick rubik), 'rubick'),
    Hero.new('Sand King',  ['Sand King', 'sk' ], 'sand-king'),
    Hero.new('Shadow Demon',  ['Shadow Demon', 'sd' ], 'shadow-demon'),
    Hero.new('Shadow Fiend',  ['Shadow Fiend', 'sf', 'fiend', 'never'], 'shadow-fiend'),
    Hero.new('Shadow Shaman',  ['Shadow Shaman', 'ss', 'shaman'], 'shadow-shaman'),
    Hero.new('Silencer',  %w(Silencer silence), 'silencer'),
    Hero.new('Skywrath Mage',  ['Skywrath Mage', 'sky', 'mage'], 'skywrath-mage'),
    Hero.new('Slardar',  %w(Slardar slar), 'slardar'),
    Hero.new('Slark',  %w(Slark), 'slark'),
    Hero.new('Sniper',  %w(Sniper snip), 'sniper'),
    Hero.new('Spectre',  %w(Spectre spec), 'spectre'),
    Hero.new('Spirit Breaker',  ['Spirit Breaker', 'sb', 'bara' ], 'spirit-breaker'),
    Hero.new('Storm Spirit',  ['Storm Spirit', 'ss', 'storm'], 'storm-spirit'),
    Hero.new('Sven',  %w(Sven), 'sven'),
    Hero.new('Templar Assassin',  ['Templar Assassin', 'ta', 'templar'], 'templar-assassin'),
    Hero.new('Terrorblade',  %w(Terrorblade tb terror), 'terrorblade'),
    Hero.new('Tidehunter',  %w(Tidehunter tide th), 'tidehunter'),
    Hero.new('Timbersaw', %w(Timbersaw timber), 'timbersaw'),
    Hero.new('Tinker',  %w(Tinker tink), 'tinker'),
    Hero.new('Tiny',  %w(Tiny), 'tiny'),
    Hero.new('Treant Protector',  ['Treant Protector', 'treant', 'tp'], 'treant-protector'),
    Hero.new('Troll Warlord',  ['Troll Warlord', 'troll', 'trol'], 'troll-warlord'),
    Hero.new('Tusk',  %w(Tusk), 'tusk'),
    Hero.new('Undying',  %w(Undying undy und), 'undying'),
    Hero.new('Ursa',  %w(Ursa urs ulfs), 'ursa'),
    Hero.new('Vengeful Spirit',  ['Vengeful Spirit', 'vs', 'venge'], 'vengeful-spirit'),
    Hero.new('Venomancer',  %w(Venomancer venom veno), 'venomancer'),
    Hero.new('Viper',  %w(Viper), 'viper'),
    Hero.new('Visage',  %w(Visage visag vis), 'visage'),
    Hero.new('Warlock', %w(Warlock), 'warlock'),
    Hero.new('Weaver',  %w(Weaver weave weav), 'weaver'),
    Hero.new('Windranger',  %w(Windranger wr wind), 'windranger'),
    Hero.new('Witch Doctor',  ['Witch Doctor', 'wd', 'witch', 'doctor'], 'witch-doctor'),
    Hero.new('Wraith King',  ['Wraith King', 'wk', 'wraith', 'leoric'], 'wraith-king'),
    Hero.new('Zeus',  %w(Zeus), 'zeus')
  ]

  def self.all_heroes
    @@heroes
  end

  # Gets all heroes whose name or alias matches
  def self.get_heroes(name)
    @@heroes.reject do |hero|
       hero.name.downcase != name.downcase and not
      hero.aliases.any? {|alias_name| alias_name.downcase == name.downcase }
    end
  end

  def add_matchup(hero, winrate)
    @matchups << Matchup.new(self, hero, winrate)
  end

  def get_matchup(hero)
    name = hero
    if hero.is_a? Hero
      name = hero.name
    end

    @matchups.find {|matchup| matchup.against == name }
  end

  def get_worst_matchups
    @matchups.sort_by {|matchup| matchup.winrate}
  end

  def to_s
    '{' +
      "hero: '#{name}'," +
      'matchups: [ ' +
        "#{@matchups.each {|matchup| matchup.to_s}.join(',')}" +
      ']' +
    '}'
  end

  def self.serialize_heroes
    YAML::dump(all_heroes)
  end

  def self.deserialize_heroes(yaml)
    @@heroes = YAML::load(yaml)
  end
end