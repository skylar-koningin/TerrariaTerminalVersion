require 'yaml'
$playerinfo = YAML.load_file('playerinfo.yml')

def playerturn
  puts "Your turn"
  sleep(0.5)
  puts "Your current health is #{$hp}"
  sleep(0.5)
  puts "Golem has #{$bosshp} HP remaining."
  sleep(0.5)
  puts "Would you like to attack or heal? (attack/heal)"
  action = gets.chomp.downcase
  if action == "attack" || action == "a" || action == "1"
    attackamount = rand(1..5)
    damage = $playerinfo['current_weapon_damage'] * attackamount
    sleep(0.5)
    if attackamount == 1
      puts "You attack Golem with your #{$playerinfo['current_weapon']} #{attackamount} time for #{damage} damage!"
    else
      puts "You attack Golem with your #{$playerinfo['current_weapon']} #{attackamount} times for #{damage} damage!"
    end
    $bosshp -= damage
    if $bosshp <= 0
      puts "You have defeated Golem!"
      $playerinfo['last_boss'] = "golem"
      $playerinfo['max_health'] += 20
      if $playerinfo['class'] == "melee"
        $playerinfo['current_weapon'] = "Flying Dragon"
        $playerinfo['current_weapon_damage'] = 180
      elsif $playerinfo['class'] == "magic"
        $playerinfo['current_weapon'] = "Staff of Earth"
        $playerinfo['current_weapon_damage'] = 125
      end
      File.open('playerinfo.yml', 'w') { |f| f.write $playerinfo.to_yaml }
      sleep(0.5)
      puts "Do you want to continue to the next boss? (yes/no)"
      answer = gets.chomp.downcase
      if answer == "yes" || answer == "y"
        puts "Now fighting: Duke Fishron"
        system("ruby DukeFishron.rb")
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
      if $hp > $maxhp - 190
        $hp = $maxhp
        puts "Healed to max health!"
      else
        $hp += 190
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
  puts "Golem's turn"
  bossattack = rand(1..3)
  if $bosshp > 30000
    if bossattack == 1
      sleep(0.5)
      puts "Golem launches an attack at you..."
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
      puts "Golem launches an attack at you..."
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
      puts "Golem launches an attack at you..."
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
      puts "Golem launches an attack at you..."
      sleep(2)
      puts "...and it grazes you."
      $hp -= 38
      sleep(0.5)
      puts "You lost 38 health..."
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
      puts "Golem launches an attack at you..."
      sleep(2)
      puts "...and it connects."
      $hp -= 76
      sleep(0.5)
      puts "You lost 76 health..."
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
      puts "Golem launches an attack at you..."
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
$bosshp = 60000

puts "Golem has awoken!"
puts "Your current weapon is a #{$playerinfo['current_weapon']} that does #{$playerinfo['current_weapon_damage']}"
playerturn()