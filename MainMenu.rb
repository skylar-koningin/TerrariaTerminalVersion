require 'yaml'
$playerinfo = YAML.load_file('playerinfo.yml')

def loadsave
  if $playerinfo['last_boss'] == nil
    puts "Last Boss Defeated: None"
    puts "Now fighting: King Slime"
    system("ruby KingSlime.rb")
  elsif $playerinfo['last_boss'] == "kingslime"
    puts "Last Boss Defeated: King Slime"
    puts "Now fighting: Eye of Cthulhu"
    system("ruby EyeofCthulhu.rb")
  elsif $playerinfo['last_boss'] == "eyeofcthulhu"
    puts "Last Boss Defeated: Eye of Cthulhu"
    if $playerinfo['feb'] == "eaterofworlds"
      puts "Now fighting: Eater of Worlds"
      system("ruby EaterofWorlds.rb")
    elsif $playerinfo['feb'] == "brainofcthulhu"
      puts "Now fighting: Brain of Cthulhu"
      system("ruby BrainofCthulhu.rb")
    end
  elsif $playerinfo['last_boss'] == "eaterofworlds"
    puts "Last Boss Defeated: Eater of Worlds"
    if $playerinfo['feb'] == "eaterofworlds"
      puts "Now fighting: Brain of Cthulhu"
      system("ruby BrainofCthulhu.rb")
    elsif $playerinfo['feb'] == "brainofcthulhu"
      puts "Now fighting: Queen Bee"
      system("ruby QueenBee.rb")
    end
  elsif $playerinfo['last_boss'] == "brainofcthulhu"
    puts "Last Boss Defeated: Brain of Cthulhu"
    if $playerinfo['feb'] == "eaterofworlds"
      puts "Now fighting: Queen Bee"
      system("ruby QueenBee.rb")
    elsif $playerinfo['feb'] == "brainofcthulhu"
      puts "Now fighting: Eater of Worlds"
      system("ruby EaterofWorlds.rb")
    end
  elsif $playerinfo['last_boss'] == "queenbee"
    puts "Last Boss Defeated: Queen Bee"
    puts "Now fighting: Skeletron"
    system("ruby Skeletron.rb")
  elsif $playerinfo['last_boss'] == "skeletron"
    puts "Last Boss Defeated: Skeletron"
    puts "Now fighting: Deerclops"
    system("ruby Deerclops.rb")
  elsif $playerinfo['last_boss'] == "deerclops"
    puts "Last Boss Defeated: Deerclops"
    puts "Now fighting: Wall of Flesh"
    system("ruby WallofFlesh.rb")
  elsif $playerinfo['last_boss'] == "wallofflesh"
    puts "Last Boss Defeated: Wall of Flesh"
    puts "Now fighting: The Twins"
    system("ruby TheTwins.rb")
  elsif $playerinfo['last_boss'] == "thetwins"
    puts "Last Boss Defeated: The Twins"
    puts "Now fighting: The Destroyer"
    system("ruby TheDestroyer.rb")
  elsif $playerinfo['last_boss'] == "thedestroyer"
    puts "Last Boss Defeated: The Destroyer"
    puts "Now fighting: Skeletron Prime"
    system("ruby SkeletronPrime.rb")
  elsif $playerinfo['last_boss'] == "skeletronprime"
    puts "Last Boss Defeated: Skeletron Prime"
    puts "Now fighting: Plantera"
    system("ruby Plantera.rb")
  elsif $playerinfo['last_boss'] == "plantera"
    puts "Last Boss Defeated: Plantera"
    puts "Now fighting: Golem"
    system("ruby Golem.rb")
  elsif $playerinfo['last_boss'] == "golem"
    puts "Last Boss Defeated: Golem"
    puts "Now fighting: Duke Fishron"
    system("ruby DukeFishron.rb")
  elsif $playerinfo['last_boss'] == "dukefishron"
    puts "Last Boss Defeated: Duke Fishron"
    puts "Now fighting: Empress of Light"
    system("ruby EmpressofLight.rb")
  elsif $playerinfo['last_boss'] == "empressoflight"
    puts "Last Boss Defeated: Empress of Light"
    puts "Now fighting: Lunatic Cultist"
    system("ruby LunaticCultist.rb")
  elsif $playerinfo['last_boss'] == "lunaticcultist"
    puts "Last Boss Defeated: Lunatic Cultist"
    puts "Now fighting: Lunar Pillars"
    system("ruby SolarPillar.rb")
  elsif $playerinfo['last_boss'] == "lunarpillars"
    puts "Last Boss Defeated: Lunar Pillars"
    puts "Now fighting: Moon Lord"
    system("ruby MoonLord.rb")
  elsif $playerinfo['last_boss'] == "moonlord"
    puts "Last Boss Defeated: Moon Lord"
    puts "Congratulations! You have defeated all the bosses in Terraria Terminal Version!"
    sleep(3)
    puts "Nah, just kidding. Th3r35 4 s1ngl3 b055 l3ft"
    system("ruby Mystery2.rb")
  elsif $playerinfo['last_boss'] == "ocram"
    puts "Last Boss Defeated: Ocram"
    puts "Congratulations! You have ACTUALLY defeated all the bosses in Terraria Terminal Version!"
    puts "Would you like to play again? (yes/no)"
    answer = gets.chomp.downcase
    if answer == "yes"
      puts "YOUR PROGRESS WILL BE DELETED!"
      puts "Are you sure? (yes/no)"
      confirm = gets.chomp.downcase
      if confirm == "yes"
        $playerinfo['name'] = nil
        $playerinfo['class'] = nil
        $playerinfo['main_weapon'] = nil
        $playerinfo['main_weapon_damage'] = nil
        $playerinfo['last_boss'] = nil
        $playerinfo['max_health'] = nil
        $playerinfo['world_evil'] = nil
        File.open('playerinfo.yml', 'w') { |f| f.write $playerinfo.to_yaml }
        system("ruby PlayerCreation.rb")
      end
    else
      puts "Thank you for playing Terraria Terminal Edition!"
      exit
    end
  end
end

system('clear')

if $playerinfo['name'] == nil
  puts "Hello new player to Terraria Terminal Edition!"
  system('ruby PlayerCreation.rb')
else
  puts "Welcome back, #{$playerinfo['name']}!"
  sleep(0.5)
  puts "Would you like to see your current stats?"
  stats = gets.chomp.downcase
  if stats == "yes" || stats == "y"
    system('ruby StatSheet.rb')
  else
    loadsave()
  end
end
