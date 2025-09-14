require 'yaml'
$playerinfo = YAML.load_file('playerinfo.yml')

def playerturn
  puts "Your turn"
  sleep(0.5)
  puts "Your current health is #{$hp}"
  sleep(0.5)
  puts "Eater of Worlds has #{$bosshp} HP remaining."
  sleep(0.5)
  puts "Would you like to attack or heal? (attack/heal)"
  action = gets.chomp.downcase
  if action == "attack" || action == "a" || action == "1"
    attackamount = rand(1..5)
    damage = $playerinfo['current_weapon_damage'] * attackamount
    sleep(0.5)
    if attackamount == 1
      puts "You attack Eater of Worlds with your #{$playerinfo['current_weapon']} #{attackamount} time for #{damage} damage!"
    else
      puts "You attack Eater of Worlds with your #{$playerinfo['current_weapon']} #{attackamount} times for #{damage} damage!"
    end
    $bosshp -= damage
    if $bosshp <= 0
      puts "You have defeated Eater of Worlds!"
      $playerinfo['last_boss'] = "eaterofworlds"
      $playerinfo['max_health'] += 20
      File.open('playerinfo.yml', 'w') { |f| f.write $playerinfo.to_yaml }
      sleep(0.5)
      puts "Do you want to continue to the next boss? (yes/no)"
      answer = gets.chomp.downcase
      if answer == "yes" || answer == "y"
        if $playerinfo['feb'] == "eaterofworlds"
          puts "Now fighting: Brain of Cthulhu"
          system("ruby BrainofCthulhu.rb")
        elsif $playerinfo['feb'] == "brainofcthulhu"
          puts "Now fighting: Queen Bee"
          system('ruby QueenBee.rb')
        end
      else
        puts "Thank you for playing Terraria Terminal Edition!"
        exit
      end
    else
      sleep(3)
      bossturn()
    end
  elsif action == "heal" || action == "h" || action == "2"
    if $playerinfo['feb'] == "eaterofworlds"
      if $hp == $maxhp
        puts "You seriously just wasted a turn dude..."
      elsif $hp < $maxhp
        if $hp > $maxhp - 70
          $hp = $maxhp
          puts "Healed to max health!"
        else
          $hp += 70
          if $hp == $maxhp
            puts "Healed to max health"
          else
            puts "Healed to #{$hp} health"
          end
        end
      end
    elsif $playerinfo['feb'] == "brainofcthulhu"
      if $hp == $maxhp
        puts "You seriously just wasted a turn dude..."
      elsif $hp < $maxhp
        if $hp > $maxhp - 80
          $hp = $maxhp
          puts "Healed to max health!"
        else
          $hp += 80
          if $hp == $maxhp
            puts "Healed to max health"
          else
            puts "Healed to #{$hp} health"
          end
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
  puts "Eater of World's turn"
  bossattack = rand(1..3)
  if bossattack == 1
    sleep(0.5)
    puts "Eater of World launches an attack at you..."
    sleep(2)
    puts "...and it grazes you."
    $hp -= 11
    sleep(0.5)
    puts "You lost 11 health..."
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
    puts "Eater of World launches an attack at you..."
    sleep(2)
    puts "...and it connects."
    $hp -= 22
    sleep(0.5)
    puts "You lost 22 health..."
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
    puts "Eater of World launches an attack at you..."
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
$bosshp = 10050

puts "Screams echo around you..."
sleep(3)
puts "Eater of Worlds has awoken!"
puts "Your current weapon is a #{$playerinfo['current_weapon']} that does #{$playerinfo['current_weapon_damage']}"
playerturn()