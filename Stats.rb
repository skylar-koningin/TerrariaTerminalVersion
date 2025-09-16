require 'yaml'
$playerdata = YAML.load_file('./boss-and-player-data/playerdata.yml')

system('clear')
puts "Name: #{$playerdata['name']}"
puts "Class: #{$playerdata['class']}"
puts "Weapon: #{$playerdata['weapon']}"
puts "Health: #{$playerdata['math']['maxhp']}"
puts "Last Boss Defeated: #{$playerdata['lbd']}"

puts ""
puts "Press enter to return..."
gets
system('ruby MainMenu.rb')