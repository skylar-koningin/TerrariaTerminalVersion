require 'yaml'
$playerinfo = YAML.load_file('playerinfo.yml')

def playerturn
  puts "Your turn"
  sleep(0.5)
  puts "Your current health is #{$hp}"
  sleep(0.5)
  puts "Skeletron Prime has #{$bosshp} HP remaining."
  sleep(0.5)
  puts "Would you like to attack or heal? (attack/heal)"
  action = gets.chomp.downcase
  if action == "attack" || action == "a" || action == "1"
    attackamount = rand(1..5)
    damage = $playerinfo['current_weapon_damage'] * attackamount
    sleep(0.5)
    if attackamount == 1
      puts "You attack Skeletron Prime with your #{$playerinfo['current_weapon']} #{attackamount} time for #{damage} damage!"
    else
      puts "You attack Skeletron Prime with your #{$playerinfo['current_weapon']} #{attackamount} times for #{damage} damage!"
    end
    $bosshp -= damage
    if $bosshp <= 0
      puts "You have defeated Skeletron Prime!"
      $playerinfo['max_health'] += 20
      File.open('playerinfo.yml', 'w') { |f| f.write $playerinfo.to_yaml }
      sleep(0.5)
      puts "Now fighting: ???"
      system('ruby ~/TerrariaTerminalVersion/mystery-bosses/Mystery1.rb')
    else
      sleep(3)
      bossturn()
    end
  elsif action == "heal" || action == "h" || action == "2"
    if $hp == $maxhp
      puts "You seriously just wasted a turn dude..."
    elsif $hp < $maxhp
      if $hp > $maxhp - 160
        $hp = $maxhp
        puts "Healed to max health!"
      else
        $hp += 160
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
  puts "Skeletron Prime's turn"
  bossattack = rand(1..3)
  if bossattack == 1
    sleep(0.5)
    puts "Skeletron Prime launches an attack at you..."
    sleep(2)
    puts "...and it grazes you."
    $hp -= 83
    sleep(0.5)
    puts "You lost 83 health..."
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
    puts "Skeletron Prime launches an attack at you..."
    sleep(2)
    puts "...and it connects."
    $hp -= 166
    sleep(0.5)
    puts "You lost 166 health..."
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
    puts "Skeletron Prime launches an attack at you..."
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
$bosshp = 28000

puts "The air is getting colder around you..."
sleep(3)
puts "Skeletron Prime has awoken!"
puts "Your current weapon is a #{$playerinfo['current_weapon']} that does #{$playerinfo['current_weapon_damage']}"
playerturn()
