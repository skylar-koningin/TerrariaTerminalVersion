require 'yaml'
$playerinfo = YAML.load_file('playerinfo.yml')

puts "#{$playerinfo['name']}'s Stats:"

puts "Max Health: #{$playerinfo['max_health']}"

if $playerinfo['class'] == "melee"
 puts "Class: Melee"
elsif $playerinfo['class'] == "ranged"
 puts "Class: Ranged"
elsif $playerinfo['class'] == "magic"
 puts "Class: Magic"
elsif $playerinfo['class'] == "summoner"
 puts "Class: Summoner"
end

puts "Current Weapon: #{$playerinfo['current_weapon']}"
puts "Current Weapon Damage: #{$playerinfo['current_weapon_damage']}"

if $playerinfo['last_boss'] == nil
 puts "Bosses Defeated: None"
elsif $playerinfo['last_boss'] == "kingslime"
 puts "Bosses Defeated: King Slime"
elsif $playerinfo['last_boss'] == "eyeofcthulhu"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu"
elsif $playerinfo['last_boss'] == "eaterofworlds"
 if $playerinfo['feb'] == "eaterofworlds"
  puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds"
 elsif $playerinfo['feb'] == "brainofcthulhu"
  puts "Bosses Defeated: King Slime, Eye of Cthulhu, BEater of Worlds, Brain of Cthulhu"
 end
elsif $playerinfo['last_boss'] == "brainofcthulhu"
 if $playerinfo['feb'] == "eaterofworlds"
  puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu"
 elsif $playerinfo['feb'] == "brainofcthulhu"
  puts "Bosses Defeated: King Slime, Eye of Cthulhu, Brain of Cthulhu"
 end
elsif $playerinfo['last_boss'] == "queenbee"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee"
elsif $playerinfo['last_boss'] == "skeletron"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron"
elsif $playerinfo['last_boss'] == "deerclops"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops"
elsif $playerinfo['last_boss'] == "wallofflesh"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops, Wall of Flesh"
elsif $playerinfo['last_boss'] == "thetwins"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops, The Twins"
elsif $playerinfo['last_boss'] == "thedestroyer"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops, Wall of Flesh, The Twins, The Destroyer"
elsif $playerinfo['last_boss'] == "skeletronprime"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops, Wall of Flesh, The Twins, The Destroyer, Skeletron Prime and Mechdusa"
elsif $playerinfo['last_boss'] == "plantera"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops, Wall of Flesh, The Twins, The Destroyer, Skeletron Prime and Mechdusa, Plantera"
elsif $playerinfo['last_boss'] == "golem"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops, Wall of Flesh, The Twins, The Destroyer, Skeletron Prime and Mechdusa, Plantera, Golem"
elsif $playerinfo['last_boss'] == "dukefishron"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops, Wall of Flesh, The Twins, The Destroyer, Skeletron Prime and Mechdusa, Plantera, Golem, Duke Fishron"
elsif $playerinfo['last_boss'] == "empressoflight"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops, Wall of Flesh,The Twins, The Destroyer, Skeletron Prime and Mechdusa, Plantera, Golem, Duke Fishron, Empress of Light"
elsif $playerinfo['last_boss'] == "lunaticcultist"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops, Wall of Flesh, The Twins, The Destroyer, Skeletron Prime and Mechdusa, Plantera, Golem, Duke Fishron, Empress of Light, Lunatic Cultist"
elsif $playerinfo['last_boss'] == "lunarpillars"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops, Wall of Flesh, The Twins, The Destroyer, Skeletron Prime and Mechdusa, Plantera, Golem, Duke Fishron, Empress of Light, Lunatic Cultist, Lunar Pillars"
elsif $playerinfo['last_boss'] == "moonlord"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops, Wall of Flesh, The Twins, The Destroyer, Skeletron Prime and Mechdusa, Plantera, Golem, Duke Fishron, Empress of Light, Lunatic Cultist, Lunar Pillars, Moon Lord"
elsif $playerinfo['last_boss'] == "ocram"
 puts "Bosses Defeated: King Slime, Eye of Cthulhu, Eater of Worlds, Brain of Cthulhu, Queen Bee, Skeletron, Deerclops, Wall of Flesh, The Twins, The Destroyer, Skeletron Prime and Mechdusa, Plantera, Golem, Duke Fishron, Empress of Light, Lunatic Cultist, Lunar Pillars, Moon Lord, Ocram"
 puts "Congratulations! You have defeated all the bosses in Terraria Terminal Edition!"
end

puts "Press enter to go back..."
gets
system('ruby ~/TerrariaTerminalVersion/MainMenu.rb')
