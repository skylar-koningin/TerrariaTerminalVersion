require 'yaml'
$playerinfo = YAML.load_file('playerinfo.yml')

def playerturn
  puts "Your turn"
  sleep(0.5)
  puts "Your current health is #{$hp}"
  sleep(0.5)
  puts "Moon Lord has #{$bosshp} HP remaining."
  sleep(0.5)
  puts "Would you like to attack or heal? (attack/heal)"
  action = gets.chomp.downcase
  if action == "attack" || action == "a" || action == "1"
    attackamount = rand(1..5)
    damage = $playerinfo['current_weapon_damage'] * attackamount
    sleep(0.5)
    if attackamount == 1
      puts "You attack Moon Lord with your #{$playerinfo['current_weapon']} #{attackamount} time for #{damage} damage!"
    else
      puts "You attack Moon Lord with your #{$playerinfo['current_weapon']} #{attackamount} times for #{damage} damage!"
    end
    $bosshp -= damage
    if $bosshp <= 0
      puts "You have defeated Moon Lord!"
      $playerinfo['max_health'] += 20
      if $playerinfo['class'] == "melee"
        $playerinfo['current_weapon'] = "Meowmere"
        $playerinfo['current_weapon_damage'] = 200
      elsif $playerinfo['class'] == "magic"
        $playerinfo['current_weapon'] = "Nebula Blaze"
        $playerinfo['current_weapon_damage'] = 130
      end
      File.open('playerinfo.yml', 'w') { |f| f.write $playerinfo.to_yaml }
      sleep(0.5)
      puts "Do you want to return to the Main Menu?"
      answer = gets.chomp.downcase
      if answer == "yes" || answer == "y"
        sleep (2)
        puts "You feel a weird surge of health"
        $playerinfo['max_health'] = 1000
        File.open('playerinfo.yml', 'w') { |f| f.write $playerinfo.to_yaml }
        sleep(0.5)
        puts "Returning to Mai..."
        sleep(1)
        puts "..."
        sleep(2)
        puts "5ign41 h1j4ck3d"
        sleep(0.5)
        puts "Your game files have been infected and taken over by Ocram!"
        system('ruby Mystery2.rb')
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
      if $hp > $maxhp - 270
        $hp = $maxhp
        puts "Healed to max health!"
      else
        $hp += 270
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
  puts "Moon Lord's turn"
  bossattack = rand(1..3)
  if bossattack == 1
    sleep(0.5)
    puts "Moon Lord launches an attack at you..."
    sleep(2)
    puts "...and it grazes you."
    $hp -= 58
    sleep(0.5)
    puts "You lost 58 health..."
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
    puts "Moon Lord launches an attack at you..."
    sleep(2)
    puts "...and it connects."
    $hp -= 115
    sleep(0.5)
    puts "You lost 115 health..."
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
    puts "Moon Lord launches an attack at you..."
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
$bosshp = 145000

puts "Impending doom approaches..."
sleep(3)
puts "Moon Lord has awoken!"
puts "Your current weapon is a #{$playerinfo['current_weapon']} that does #{$playerinfo['current_weapon_damage']}"
playerturn()
