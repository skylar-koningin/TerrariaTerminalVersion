require 'yaml'
$playerinfo = YAML.load_file('playerinfo.yml')

def playerturn
  puts "Your turn"
  sleep(0.5)
  puts "Your current health is #{$hp}"
  sleep(0.5)
  puts "Plantera has #{$bosshp} HP remaining."
  sleep(0.5)
  puts "Would you like to attack or heal? (attack/heal)"
  action = gets.chomp.downcase
  if action == "attack" || action == "a" || action == "1"
    attackamount = rand(1..5)
    damage = $playerinfo['current_weapon_damage'] * attackamount
    sleep(0.5)
    if attackamount == 1
      puts "You attack Plantera with your #{$playerinfo['current_weapon']} #{attackamount} time for #{damage} damage!"
    else
      puts "You attack Plantera with your #{$playerinfo['current_weapon']} #{attackamount} times for #{damage} damage!"
    end
    $bosshp -= damage
    if $bosshp <= 0
      puts "You have defeated Plantera!"
      $playerinfo['last_boss'] = "plantera"
      $playerinfo['max_health'] += 20
      if $playerinfo['class'] == "melee"
        $playerinfo['current_weapon'] = "The Horseman's Blade"
        $playerinfo['current_weapon_damage'] = 150
      elsif $playerinfo['class'] == "ranged"
        $playerinfo['current_weapon'] = "Sniper Rifle"
        $playerinfo['current_weapon_damage'] = 185
      elsif $playerinfo['class'] == "summoner"
        $playerinfo['current_weapon'] = "Kaleidoscope"
        $playerinfo['current_weapon_damage'] = 180
      File.open('playerinfo.yml', 'w') { |f| f.write $playerinfo.to_yaml }
      sleep(0.5)
      puts "Do you want to continue to the next boss? (yes/no)"
      answer = gets.chomp.downcase
      if answer == "yes" || answer == "y"
        puts "Now fighting: Golem"
        system("ruby Golem.rb")
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
      if $hp > $maxhp - 180
        $hp = $maxhp
        puts "Healed to max health!"
      else
        $hp += 180
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
  puts "Plantera's turn"
  bossattack = rand(1..3)
  if $bosshp > 15000
    if bossattack == 1
      sleep(0.5)
      puts "Plantera launches an attack at you..."
      sleep(2)
      puts "...and it grazes you."
      $hp -= 31
      sleep(0.5)
      puts "You lost 31 health..."
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
      puts "Plantera launches an attack at you..."
      sleep(2)
      puts "...and it connects."
      $hp -= 62
      sleep(0.5)
      puts "You lost 62 health..."
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
      puts "Plantera launches an attack at you..."
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
  else
    if bossattack == 1
      sleep(0.5)
      puts "Plantera launches an attack at you..."
      sleep(2)
      puts "...and it grazes you."
      $hp -= 35
      sleep(0.5)
      puts "You lost 35 health..."
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
      puts "Plantera launches an attack at you..."
      sleep(2)
      puts "...and it connects."
      $hp -= 70
      sleep(0.5)
      puts "You lost 70 health..."
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
      puts "Plantera launches an attack at you..."
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
end

$hp = $playerinfo['max_health']
$maxhp = $playerinfo['max_health']
$bosshp = 30000

puts "Plantera has awoken!"
puts "Your current weapon is a #{$playerinfo['current_weapon']} that does #{$playerinfo['current_weapon_damage']}"
playerturn()