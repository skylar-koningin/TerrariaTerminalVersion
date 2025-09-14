require 'yaml'
$playerinfo = YAML.load_file('playerinfo.yml')

def playerturn
  puts "Your turn"
  sleep(0.5)
  puts "Your current health is #{$hp}"
  sleep(0.5)
  puts "Lunatic Cultist has #{$bosshp} HP remaining."
  sleep(0.5)
  puts "Would you like to attack or heal? (attack/heal)"
  action = gets.chomp.downcase
  if action == "attack" || action == "a" || action == "1"
    attackamount = rand(1..5)
    damage = $playerinfo['current_weapon_damage'] * attackamount
    sleep(0.5)
    if attackamount == 1
      puts "You attack Lunatic Cultist with your #{$playerinfo['current_weapon']} #{attackamount} time for #{damage} damage!"
    else
      puts "You attack Lunatic Cultist with your #{$playerinfo['current_weapon']} #{attackamount} times for #{damage} damage!"
    end
    $bosshp -= damage
    if $bosshp <= 0
      puts "You have defeated Lunatic Cultist!"
      $playerinfo['last_boss'] = "lunaticcultist"
      $playerinfo['max_health'] += 20
      File.open('playerinfo.yml', 'w') { |f| f.write $playerinfo.to_yaml }
      sleep(0.5)
      puts "Do you want to continue to the next boss? (yes/no)"
      answer = gets.chomp.downcase
      if answer == "yes" || answer == "y"
        puts "Now fighting: Solar Pillar"
        system("ruby SolarPillar.rb")
      else
        puts "Thank you for playing Terraria Terminal Edition!"
        exit
      end
    else
      sleep(3)
      bossturn()
    end
  elsif action == "heal" || action == "h" || action == "2"
    if $hp == $maxhp
      puts "You seriously just wasted a turn dude..."
    elsif $hp < $maxhp
      if $hp > $maxhp - 220
        $hp = $maxhp
        puts "Healed to max health!"
      else
        $hp += 220
        if $hp == $maxhp
          puts "Healed to max health"
        else
          puts "Healed to #{$hp} health"
        end
      end
    end
    sleep(3)
    bossturn()
  else
    puts "You screwed yourself..."
    sleep(3)
    bossturn()
  end
end

def bossturn
  system('clear')
  puts "Lunatic Cultist's turn"
  bossattack = rand(1..3)
  if bossattack == 1
    sleep(0.5)
    puts "Lunatic Cultist launches an attack at you..."
    sleep(2)
    puts "...and it grazes you."
    $hp -= 60
    sleep(0.5)
    puts "You lost 60 health..."
    sleep(3)
    system('clear')
    if $hp > 0
      playerturn()
    else
      puts "You have been slain"
      exit
    end
  elsif bossattack == 2
    sleep(0.5)
    puts "Lunatic Cultist launches an attack at you..."
    sleep(2)
    puts "...and it connects."
    $hp -= 120
    sleep(0.5)
    puts "You lost 120 health..."
    sleep(3)
    system('clear')
    if $hp > 0
      playerturn()
    else
      puts "You have been slain"
      exit
    end
  else
    sleep(0.5)
    puts "Lunatic Cultist launches an attack at you..."
    sleep(2)
    puts "...AND IT ENTIRELY MISSES!"
    sleep(0.5)
    puts "You got lucky!"
    sleep(3)
    system('clear')
    if $hp > 0
      playerturn()
    else
      puts "You have been slain"
      exit
    end
  end
end

$hp = $playerinfo['max_health']
$maxhp = $playerinfo['max_health']
$bosshp = 32000

puts "Lunatic Cultist has awoken!"
puts "Your current weapon is a #{$playerinfo['current_weapon']} that does #{$playerinfo['current_weapon_damage']}"
playerturn()