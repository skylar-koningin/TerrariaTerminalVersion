require 'yaml'
$playerdata = YAML.load_file('./boss-and-player-data/playerdata.yml')
$name = $playerdata['name']

system('clear')
if $name == nil
  sleep(0.5)
  puts "Welcome to Terraria Terminal Version!"
  sleep(0.5)
  puts "Would you like to create a charater?"
  creation = gets.chomp.downcase
  if creation == "yes" || creation == "y"
    system('ruby PlayerCreation.rb')
  else
    sleep(0.5)
    puts "Okay then, see you later!"
    exit
  end
else
  sleep(0.5)
  puts "Welcome back, #{$name}!"
  sleep(0.5)
  puts "Would you like to play, see your stats, or exit?"
  answer = gets.chomp.downcase
  if answer == "play" || answer == "p"
    system('ruby Battle.rb')
  elsif answer == "stats" || answer == "see stats" || answer == "s"
    system('Stats.rb')
  else
    puts "Exiting..."
    exit
  end
end
