require_relative 'crawler'
require_relative 'hero'

arg = ARGV.first
crawler = Crawler.new
if File.exists? 'data' and not arg.eql? '--reset'
  puts 'Loading hero matchup information from local data file'
  Hero.deserialize_heroes File.read 'data'
else
  puts 'Loading data from dotabuff.com'
  crawler.load_heroes
  File.write('data', Hero.serialize_heroes)
end

while(true)
  puts 'Introduce the hero names you want to counter separated by a space'
  countering = gets
  hero_names = countering.split ' '
  ambiguous = false
  heroes = hero_names.collect do |hero_name|
    matching = Hero.get_heroes(hero_name)
    if matching.count == 0
      puts 'No hero name matched: ' + hero_name
      ambiguous = true
      next nil
    end

    if matching.count > 1
      puts 'Hero name matched: ' + hero_name + ', please disambiguate using an alias.'
      puts 'Matching heroes: ' + matching.collect {|hero| hero.name }.join(', ')
      ambiguous = true
      next nil
    end

    next matching.first
  end

  next if ambiguous

  crawler.get_best_counter(heroes).reverse.each do |hero, score|
    puts "#{hero.name} score: #{score}"
  end
end