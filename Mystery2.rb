require 'yaml'
$playerinfo = YAML.load_file('playerinfo.yml')

def playerturn
  puts "Your turn"
  sleep(0.5)
  puts "Your current health is #{$hp}"
  sleep(0.5)
  puts "Ocram has #{$bosshp} HP remaining."
  sleep(0.5)
  puts "Would you like to attack or heal? (attack/heal)"
  action = gets.chomp.downcase
  if action == "attack" || action == "a" || action == "1"
    attackamount = rand(1..5)
    damage = $playerinfo['current_weapon_damage'] * attackamount
    sleep(0.5)
    if attackamount == 1
      puts "You attack Ocram with your #{$playerinfo['current_weapon']} #{attackamount} time for #{damage} damage!"
    else
      puts "You attack Ocram with your #{$playerinfo['current_weapon']} #{attackamount} times for #{damage} damage!"
    end
    $bosshp -= damage
    if $bosshp <= 0
      puts "Ocram: *cough* *cough* That was... a *cough*... good fight."
      sleep(1)
      puts "Ocram: I *cough* now see that I was *cough* *cough* too weak to *cough* be *cough* in Terraria..."
      sleep(1)
      puts "Ocram dies, knowing that the time it was in Terraria was the best time of its life."
      sleep(1)
      puts "#{$playerinfo['name']}: I'm so sorry I had to kill you... *o7*"
      sleep(1)
      puts "#{$playerinfo['name']} disconnects from the game, wishing they never killed Ocram..."
      sleep(1)
      puts "You have defeated Ocram!"
      $playerinfo['last_boss'] = "ocram"
      File.open('playerinfo.yml', 'w') { |f| f.write $playerinfo.to_yaml }
      sleep(1)
      puts "Returning to Main Menu..."
      system('ruby MainMenu.rb')
    else
      sleep(3)
      bossturn()
    end
  elsif action == "heal" || action == "h" || action == "2"
    if $hp == $maxhp
      puts "You seriously just wasted a turn dude..."
    elsif $hp < $maxhp
      if $hp > $maxhp - 280
        $hp = $maxhp
        puts "Healed to max health!"
      else
        $hp += 280
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
  puts "Ocram's turn"
  bossattack = rand(1..3)
  if $bosshp > 87500
    if bossattack == 1
      sleep(0.5)
      puts "Ocram launches an attack at you..."
      sleep(2)
      puts "...and it grazes you."
      $hp -= 130
      sleep(0.5)
      puts "You lost 130 health..."
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
      puts "Ocram launches an attack at you..."
      sleep(2)
      puts "...and it connects."
      $hp -= 260
      sleep(0.5)
      puts "You lost 260 health..."
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
      puts "Ocram launches an attack at you..."
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
      puts "Ocram launches an attack at you..."
      sleep(2)
      puts "...and it grazes you."
      $hp -= 180
      sleep(0.5)
      puts "You lost 180 health..."
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
      puts "Ocram launches an attack at you..."
      sleep(2)
      puts "...and it connects."
      $hp -= 360
      sleep(0.5)
      puts "You lost 360 health..."
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
      puts "Ocram launches an attack at you..."
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
$bosshp = 175000

puts "Ocram has awoken!"
sleep(0.5)
puts "Ocram: Its good to be back!"
sleep(0.5)
puts "Ocram: I have been in Redigit's vault since December 14, 2017, and to get revenge on him, I'm going to destroy all of Terraria, starting with this stupid fangame! HAHAHA!"
sleep(2)
puts "#{$playerinfo['name']}: You won't."
sleep(2)
puts "Ocram: What did you say, you little.. weird.. thing?"
sleep(0.5)
puts "#{$playerinfo['name']}: You won't."
sleep(1)
puts "Ocram: I'm going to do it RIGHT now!"
sleep(0.5)
puts "#{$playerinfo['name']}: Nuh uh."
sleep(0.5)
puts "Ocram: YES I AM!!"
sleep(0.5)
puts "#{$playerinfo['name']}: Nuh uh."
sleep(0.5)
puts "Ocram: YOU KNOW WHAT, I'M GOING TO START Of BY KILLING YOU!"
sleep(0.5)
puts "Ocram has a very angry expression on its face..."
sleep(0.5)
puts "Your final weapon is a #{$playerinfo['current_weapon']} that does #{$playerinfo['current_weapon_damage']}"
sleep(3)
playerturn()
