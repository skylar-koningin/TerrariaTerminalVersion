require 'yaml'
$playerinfo = YAML.load_file('playerinfo.yml')

def playerturn
  puts "Your turn"
  sleep(0.5)
  puts "Your current health is #{$hp}"
  sleep(0.5)
  puts "The Twins have #{$bosshp} HP remaining."
  sleep(0.5)
  puts "Would you like to attack or heal? (attack/heal)"
  action = gets.chomp.downcase
  if action == "attack" || action == "a" || action == "1"
    attackamount = rand(1..5)
    damage = $playerinfo['current_weapon_damage'] * attackamount
    sleep(0.5)
    if attackamount == 1
      puts "You attack The Twins with your #{$playerinfo['current_weapon']} #{attackamount} time for #{damage} damage!"
    else
      puts "You attack The Twins with your #{$playerinfo['current_weapon']} #{attackamount} times for #{damage} damage!"
    end
    $bosshp -= damage
    if $bosshp <= 0
      puts "You have defeated The Twins!"
      $playerinfo['last_boss'] = "thetwins"
      $playerinfo['max_health'] += 20
      File.open('playerinfo.yml', 'w') { |f| f.write $playerinfo.to_yaml }
      sleep(0.5)
      puts "Do you want to continue to the next boss? (yes/no)"
      answer = gets.chomp.downcase
      if answer == "yes" || answer == "y"
        puts "Now fighting: The Destroyer"
        system("ruby TheDestroyer.rb")
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
      if $hp > $maxhp - 140
        $hp = $maxhp
        puts "Healed to max health!"
      else
        $hp += 140
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
  puts "The Twins's turn"
  bossattack = rand(1..3)
  if $bosshp > 8600
    if bossattack == 1
      sleep(0.5)
      puts "The Twins launch an attack at you..."
      sleep(2)
      puts "...and it grazes you."
      $hp -= 24
      sleep(0.5)
      puts "You lost 24 health..."
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
      puts "The Twins launch an attack at you..."
      sleep(2)
      puts "...and it connects."
      $hp -= 48
      sleep(0.5)
      puts "You lost 48 health..."
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
      puts "The Twins launch an attack at you..."
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
      puts "The Twins launch an attack at you..."
      sleep(2)
      puts "...and it grazes you."
      $hp -= 36
      sleep(0.5)
      puts "You lost 36 health..."
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
      puts "The Twins launch an attack at you..."
      sleep(2)
      puts "...and it connects."
      $hp -= 71
      sleep(0.5)
      puts "You lost 71 health..."
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
      puts "The Twins launch an attack at you..."
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
$bosshp = 43000

puts "This is going to be a terrible night..."
sleep(3)
puts "The Twins have awoken!"
puts "Your current weapon is a #{$playerinfo['current_weapon']} that does #{$playerinfo['current_weapon_damage']}"
playerturn()