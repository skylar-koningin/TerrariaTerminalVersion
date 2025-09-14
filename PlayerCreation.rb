require 'yaml'
$playerinfo = YAML.load_file('playerinfo.yml')

def classselect
  if $classselection == "melee"
    $playerinfo['class'] = "melee"
    $playerinfo['current_weapon'] = "Arkhalis"
    $playerinfo['current_weapon_damage'] = 25
  elsif $classselection == "ranged"
    $playerinfo['class'] = "ranged"
    $playerinfo['current_weapon'] = "Grenade"
    $playerinfo['current_weapon_damage'] = 60
  elsif $classselection == "magic"
    $playerinfo['class'] = "magic"
    $playerinfo['current_weapon'] = "Demon Scythe"
    $playerinfo['current_weapon_damage'] = 35
  elsif $classselection == "summoner"
    $playerinfo['class'] = "summoner"
    $playerinfo['current_weapon'] = "Snapthorn"
    $playerinfo['current_weapon_damage'] = 18
  else
    puts "Please try again..."
    classselect()
  end
end

puts "First, what is your name?"
$playerinfo['name'] = gets.chomp

puts "Second, do you want to be a Melee, Ranged, Magic, or Summoner?"
$classselection = gets.chomp.downcase
classselect()

firstevilboss = rand(1..2)
if firstevilboss == 1
  $playerinfo['feb'] = "eaterofworlds"
elsif firstevilboss == 2
  $playerinfo['feb'] = "brainofcthulhu"
end

$playerinfo['max_health'] = 100

File.open('playerinfo.yml', 'w') { |f| f.write $playerinfo.to_yaml }

puts "Now that you have a player created, would you like to play now?"
answer = gets.chomp.downcase
if answer == "yes" || answer == "y"
  puts "Ok, your first fight is against the King Slime!"
  system('ruby KingSlime.rb')
else
  puts "Okay! I hope to see you later!"
  exit
end
