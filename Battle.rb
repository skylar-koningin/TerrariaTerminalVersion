require 'yaml'
$playerdata = YAML.load_file('./boss-and-player-data/playerdata.yml')
$prevboss = $playerdata['lbd']
$feb = $playerdata['feb']
$currentboss = ""

def corruptedsave
  $playerdata['name'] = nil
  File.write('./boss-and-player-data/playerdata.yml', $playerdata.to_yaml)
  system('MainMenu.rb')
end

def wbaif
  if $prevboss == nil
    $bossdata = YAML.load_file('./boss-and-player-data/kingslime.yml')
    $currentboss = "kingslime"
  elsif $prevboss == "kingslime"
    $bossdata = YAML.load_file('./boss-and-player-data/eyeofcthulhu.yml')
    $currentboss = "eyeocthulhu"
  elsif $prevboss == "eyeofcthulhu"
    if $feb == "eaterofworlds"
      $bossdata = YAML.load_file('./boss-and-player-data/eaterofworlds.yml')
      $currentboss = "eaterofworlds"
    elsif $feb == "brainofcthulhu"
      $bossdata = YAML.load_file('./boss-and-player-data/brainofcthulhu.yml')
      $currentboss = "brainofcthulhu"
    else
      corruptedsave()
    end
  elsif $prevboss == "eaterofworlds"
    if $feb == "eaterofworlds"
      $bossdata = YAML.load_file('./boss-and-player-data/brainofcthulhu.yml')
      $currentboss = "brainofcthulhu"
    elsif $feb == "brainofcthulhu"
      $bossdata = YAML.load_file('./boss-and-player-data/queenbee.yml')
      $currentboss = "queenbee"
    else
      corruptedsave()
    end
  elsif $prevboss == "brainofcthulhu"
    if $feb == "eaterofworlds"
      $bossdata = YAML.load_file('./boss-and-player-data/queenbee.yml')
      $currentboss = "queenbee"
    elsif $feb == "brainofcthulhu"
      $bossdata = YAML.load_file('./boss-and-player-data/eaterofworlds.yml')
      $currentboss = "eaterofworlds"
    else
      corruptedsave()
    end
  elsif $prevboss == "queenbee"
    $bossdata = YAML.load_file('./boss-and-player-data/skeletron.yml')
    $currentboss = "skeletron"
  elsif $prevboss == "skeletron"
    $bossdata = YAML.load_file('./boss-and-player-data/deerclops.yml')
    $currentboss = "deerclops"
  elsif $prevboss == "deerclops"
    $bossdata = YAML.load_file('./boss-and-player-data/wallofflesh.yml')
    $currentboss = "wallofflesh"
  elsif $prevboss == "walloflfesh"
    $bossdata = YAML.load_file('./boss-and-player-data/queenslime.yml')
    $currentboss = "queenslime"
  elsif $prevboss == "queenslime"
    if $playerdata['mechs']['thetwins'] == 1
      $bossdata = YAML.load_file('./boss-and-player-data/thetwins.yml')
      $currentboss = "thetwins"
    elsif $playerdata['mechs']['thedestroyer'] == 1
      $bossdata = YAML.load_file('./boss-and-player-data/thedestroyer.yml')
      $currentboss = "thedestroyer"
    elsif $playerdata['mechs']['skeletronprime'] == 1
      $bossdata = YAML.load_file('./boss-and-player-data/skeletronprime.yml')
      $currentboss = "skeletronprime"
    else
      corruptedsave()
    end
  elsif $prevboss == "thetwins"
    if  $playerdata['mechs']['thetwins'] == 1
      if $playerdata['mechs']['thedestroyer'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/thedestroyer.yml')
        $currentboss = "thedestroyer"
      elsif $playerdata['mechs']['skeletronprime'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/skeletronprime.yml')
        $currentboss = "skeletronprime"
      else
        corruptedsave()
      end
    elsif $playerdata['mechs']['thetwins'] == 2
      if $playerdata['mechs']['thedestroyer'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/thedestroyer.yml')
        $currentboss = "thedestroyer"
      elsif $playerdata['mechs']['skeletronprime'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/skeletronprime.yml')
        $currentboss = "skeletronprime"
      else
        corruptedsave()
      end
    elsif $playerdata['mechs']['thetwins'] == 3
      $bossdata = YAML.load_file('./boss-and-player-data/mechdusa.yml')
      $currentboss = "mechdusa"
    else
      corruptedsave()
    end
  elsif $prevboss == "thedestroyer"
    if  $playerdata['mechs']['thedestroyer'] == 1
      if $playerdata['mechs']['thetwins'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/thetwins.yml')
        $currentboss = "thetwins"
      elsif $playerdata['mechs']['skeletronprime'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/skeletronprime.yml')
        $currentboss = "skeletronprime"
      else
        corruptedsave()
      end
    elsif $playerdata['mechs']['thedestroyer'] == 2
      if $playerdata['mechs']['thetwins'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/thetwins.yml')
        $currentboss = "thetwins"
      elsif $playerdata['mechs']['skeletronprime'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/skeletronprime.yml')
        $currentboss = "skeletronprime"
      else
        corruptedsave()
      end
    elsif $playerdata['mechs']['thedestroyer'] == 3
      $bossdata = YAML.load_file('./boss-and-player-data/mechdusa.yml')
      $currentboss = "mechdusa"
    else
      corruptedsave()
    end
  elsif $prevboss == "skeletronprime"
    if  $playerdata['mechs']['skeletronprime'] == 1
      if $playerdata['mechs']['thedestroyer'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/thedestroyer.yml')
        $currentboss = "thedestroyer"
      elsif $playerdata['mechs']['thetwins'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/thetwins.yml')
        $currentboss = "thetwins"
      else
        corruptedsave()
      end
    elsif $playerdata['mechs']['skeletronprime'] == 2
      if $playerdata['mechs']['thedestroyer'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/thedestroyer.yml')
        $currentboss = "thedestroyer"
      elsif $playerdata['mechs']['thetwins'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/thetwins.yml')
        $currentboss = "thetwins"
      else
        corruptedsave()
      end
    elsif $playerdata['mechs']['skeletronprime'] == 3
      $bossdata = YAML.load_file('./boss-and-player-data/mechdusa.yml')
      $currentboss = "mechdusa"
    else
      corruptedsave()
    end
  elsif $prevboss == "mechdusa"
    $bossdata = YAML.load_file('./boss-and-player-data/plantera.yml')
    $currentboss = "plantera"
  elsif $prevboss == "plantera"
    $bossdata = YAML.load_file('./boss-and-player-data/golem.yml')
    $currentboss = "golem"
  elsif $prevboss == "golem"
    $bossdata = YAML.load_file('./boss-and-player-data/dukefishron.yml')
    $currentboss = "dukefishron"
  elsif $prevboss == "dukefishron"
    $bossdata = YAML.load_file('./boss-and-player-data/empressoflight.yml')
    $currentboss = "empressoflight"
  elsif $prevboss == "empressoflight"
    $bossdata = YAML.load_file('./boss-and-player-data/lunaticcultist.yml')
    $currentboss = "lunaticcultist"
  elsif $prevboss == "lunaticcultist"
    if $playerdata['pillars']['solar'] == 1
      $bossdata = YAML.load_file('./boss-and-player-data/solarpillar.yml')
      $currentboss = "solarpillar"
    elsif $playerdata['pillars']['nebula'] == 1
      $bossdata = YAML.load_file('./boss-and-player-data/nebulapillar.yml')
      $currentboss = "nebulapillar"
    elsif $playerdata['pillars']['vortex'] == 1
      $bossdata = YAML.load_file('./boss-and-player-data/vortexpillar.yml')
      $currentboss = "vortexpillar"
    elsif $playerdata['pillars']['stardust'] == 1
      $bossdata = YAML.load_file('./boss-and-player-data/stardustpillar.yml')
      $currentboss = "stardustpillar"
    else
      corruptedsave()
    end
  elsif $prevboss == "solarpillar"
    if $playerdata['pillars']['solar'] == 1
      if $playerdata['pillars']['nebula'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/nebulapillar.yml')
        $currentboss = "nebulapillar"
      elsif $playerdata['pillars']['vortex'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/vortexpillar.yml')
        $currentboss = "vortexpillar"
      elsif $playerdata['pillars']['stardust'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/stardustpillar.yml')
        $currentboss = "stardustpillar"
      else
        corruptedsave()
      end
    elsif $playerdata['pillars']['solar'] == 2
      if $playerdata['pillars']['nebula'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/nebulapillar.yml')
        $currentboss = "nebulapillar"
      elsif $playerdata['pillars']['vortex'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/vortexpillar.yml')
        $currentboss = "vortexpillar"
      elsif $playerdata['pillars']['stardust'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/stardustpillar.yml')
        $currentboss = "stardustpillar"
      else
        corruptedsave()
      end
    elsif $playerdata['pillars']['solar'] == 3
      if $playerdata['pillars']['nebula'] == 4
        $bossdata = YAML.load_file('./boss-and-player-data/nebulapillar.yml')
        $currentboss = "nebulapillar"
      elsif $playerdata['pillars']['vortex'] == 4
        $bossdata = YAML.load_file('./boss-and-player-data/vortexpillar.yml')
        $currentboss = "vortexpillar"
      elsif $playerdata['pillars']['stardust'] == 4
        $bossdata = YAML.load_file('./boss-and-player-data/stardustpillar.yml')
        $currentboss = "stardustpillar"
      else
        corruptedsave()
      end
    elsif $playerdata['pillars']['solar'] == 4
      $bossdata = YAML.load_file('./boss-and-player-data/moonlord.yml')
      $currentboss = "moonlord"
    else
      corruptedsave()
    end
    elsif $prevboss == "nebulapillar"
    if $playerdata['pillars']['nebula'] == 1
      if $playerdata['pillars']['solar'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/solarpillar.yml')
        $currentboss = "solarpillar"
      elsif $playerdata['pillars']['vortex'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/vortexpillar.yml')
        $currentboss = "vortexpillar"
      elsif $playerdata['pillars']['stardust'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/stardustpillar.yml')
        $currentboss = "stardustpillar"
      else
        corruptedsave()
      end
    elsif $playerdata['pillars']['nebula'] == 2
      if $playerdata['pillars']['solar'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/solarpillar.yml')
        $currentboss = "solarpillar"
      elsif $playerdata['pillars']['vortex'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/vortexpillar.yml')
        $currentboss = "vortexpillar"
      elsif $playerdata['pillars']['stardust'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/stardustpillar.yml')
        $currentboss = "stardustpillar"
      else
        corruptedsave()
      end
    elsif $playerdata['pillars']['nebula'] == 3
      if $playerdata['pillars']['solar'] == 4
        $bossdata = YAML.load_file('./boss-and-player-data/solarpillar.yml')
        $currentboss = "solarpillar"
      elsif $playerdata['pillars']['vortex'] == 4
        $bossdata = YAML.load_file('./boss-and-player-data/vortexpillar.yml')
        $currentboss = "vortexpillar"
      elsif $playerdata['pillars']['stardust'] == 4
        $bossdata = YAML.load_file('./boss-and-player-data/stardustpillar.yml')
        $currentboss = "stardustpillar"
      else
        corruptedsave()
      end
    elsif $playerdata['pillars']['nebula'] == 4
      $bossdata = YAML.load_file('./boss-and-player-data/moonlord.yml')
      $currentboss = "moonlord"
    else
      corruptedsave()
    end
  elsif $prevboss == "vortexpillar"
    if $playerdata['pillars']['vortex'] == 1
      if $playerdata['pillars']['nebula'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/nebulapillar.yml')
        $currentboss = "nebulapillar"
      elsif $playerdata['pillars']['solar'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/solarpillar.yml')
        $currentboss = "solarpillar"
      elsif $playerdata['pillars']['stardust'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/stardustpillar.yml')
        $currentboss = "stardustpillar"
      else
        corruptedsave()
      end
    elsif $playerdata['pillars']['vortex'] == 2
      if $playerdata['pillars']['nebula'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/nebulapillar.yml')
        $currentboss = "nebulapillar"
      elsif $playerdata['pillars']['solar'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/solarpillar.yml')
        $currentboss = "solarpillar"
      elsif $playerdata['pillars']['stardust'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/stardustpillar.yml')
        $currentboss = "stardustpillar"
      else
        corruptedsave()
      end
    elsif $playerdata['pillars']['vortex'] == 3
      if $playerdata['pillars']['nebula'] == 4
        $bossdata = YAML.load_file('./boss-and-player-data/nebulapillar.yml')
        $currentboss = "nebulapillar"
      elsif $playerdata['pillars']['solar'] == 4
        $bossdata = YAML.load_file('./boss-and-player-data/solarpillar.yml')
        $currentboss = "solarpillar"
      elsif $playerdata['pillars']['stardust'] == 4
        $bossdata = YAML.load_file('./boss-and-player-data/stardustpillar.yml')
        $currentboss = "stardustpillar"
      else
        corruptedsave()
      end
    elsif $playerdata['pillars']['vortex'] == 4
      $bossdata = YAML.load_file('./boss-and-player-data/moonlord.yml')
      $currentboss = "moonlord"
    else
      corruptedsave()
    end
  elsif $prevboss == "stardustpillar"
    if $playerdata['pillars']['stardust'] == 1
      if $playerdata['pillars']['nebula'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/nebulapillar.yml')
        $currentboss = "nebulapillar"
      elsif $playerdata['pillars']['vortex'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/vortexpillar.yml')
        $currentboss = "vortexpillar"
      elsif $playerdata['pillars']['solar'] == 2
        $bossdata = YAML.load_file('./boss-and-player-data/solarpillar.yml')
        $currentboss = "solarpillar"
      else
        corruptedsave()
      end
    elsif $playerdata['pillars']['stardust'] == 2
      if $playerdata['pillars']['nebula'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/nebulapillar.yml')
        $currentboss = "nebulapillar"
      elsif $playerdata['pillars']['vortex'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/vortexpillar.yml')
        $currentboss = "vortexpillar"
      elsif $playerdata['pillars']['solar'] == 3
        $bossdata = YAML.load_file('./boss-and-player-data/solarpillar.yml')
        $currentboss = "solarpillar"
      else
        corruptedsave()
      end
    elsif $playerdata['pillars']['stardust'] == 3
      if $playerdata['pillars']['nebula'] == 4
        $bossdata = YAML.load_file('./boss-and-player-data/nebulapillar.yml')
        $currentboss = "nebulapillar"
      elsif $playerdata['pillars']['vortex'] == 4
        $bossdata = YAML.load_file('./boss-and-player-data/vortexpillar.yml')
        $currentboss = "vortexpillar"
      elsif $playerdata['pillars']['solar'] == 4
        $bossdata = YAML.load_file('./boss-and-player-data/solarpillar.yml')
        $currentboss = "solarpillar"
      else
        corruptedsave()
      end
    elsif $playerdata['pillars']['stardust'] == 4
      $bossdata = YAML.load_file('./boss-and-player-data/moonlord.yml')
      $currentboss = "moonlord"
    else
      corruptedsave()
    end
  elsif $prevboss == "moonlord"
    $bossdata = YAML.load_file('./boss-and-player-data/ocram.yml')
    $currentboss = "ocram"
  elsif $prevboss == "ocram"
    puts "Do you want to restart?"
    answer = gets.champ.downcase
    if answer == "yes" || answer == "y"
      corruptedsave()
    else
      exit
    end
  end
end

wbaif()

def varset
  $maxhp = $playerdata['math']['maxhp']
  $hp = $playerdata['math']['maxhp']
  $potionheal = $playerdata['math']['potionheal']
  $def = $playerdata['math']['def']
  $dmg = $playerdata['math']['dmg']
  $weapon = $playerdata['weapon']
  $bosshp = $bossdata['maxhp']
  $forms = $bossdata['forms']
  $formswitch = $bossdata['formswitch']
  $bossdef = $bossdata['form1']['def']
  $attacks = $bossdata['form1']['attacks']
  $name = $bossdata['name']
  $intid = $bossdata['internalid']
end

def playerturn
  sleep(0.5)
  puts "Your Turn:"
  sleep(0.5)
  puts "You have #{$hp}/#{$maxhp} health left."
  sleep(0.5)
  puts "#{$name} has #{$bosshp} HP left."
  sleep(0.5)
  puts "Do you want to attack (1/a/attack) or heal (2/h/heal)"
  decision = gets.chomp.downcase
  if decision == "1" || decision == "a" || decision == "attack"
    netdmg = ($dmg - ($bossdef * 0.5)).floor
    attackamount = rand(1..10)
    damage = netdmg * attackamount
    $bosshp -= damage
    sleep(0.5)
    if $weapon == "Grenade"
      puts "You threw #{attackamount} grenades at #{$name} and dealt #{damage} damage."
    else
      puts "You hit #{$name} #{attackamount} times with your #{$weapon} and dealt #{damage} damage"
    end
    if $bosshp <= 0
      sleep(0.5)
      puts "You defeated #{$name}!"
      $playerdata['math']['maxhp'] += 20
      $playerdata['math']['potionheal'] += 10
      $playerdata['lbd'] = $intid
      if $intid == "eyeofcthulhu"
        if $playerdata['class'] == "melee"
          $playerdata['weapon'] = "Volcano"
          $playerdata['math']['dmg'] = 40
        elsif $playerdata['class'] == "magic"
          $playerdata['weapon'] = "Flower of Fire"
          $playerdata['math']['dmg'] = 48
        elsif $playerdata['class'] == "summoner"
          $playerdata['weapon'] = "Spinal Tap"
          $playerdata['math']['dmg'] = 27
        end
      elsif $intid == "wallofflesh"
        if $playerdata['class'] == "melee"
          $playerdata['weapon'] = "Drippler Crippler"
          $playerdata['math']['dmg'] = 110
        elsif $playerdata['class'] == "magic"
          $playerdata['weapon'] = "Orange Zapinator"
          $playerdata['math']['dmg'] = 100
        elsif $playerdata['class'] == "summoner"
          $playerdata['weapon'] = "Cool Whip"
          $playerdata['math']['dmg'] = 45
        end
      elsif $intid == "mechdusa"
        if $playerdata['class'] == "ranged"
          $playerdata['weapon'] = "Super Star Shooter"
          $playerdata['math']['dmg'] = 60
        elsif $playerdata['class'] == "summoner"
          $playerdata['weapon'] = "Durendal"
          $playerdata['math']['dmg'] = 55
        end
      elsif $intid == "plantera"
        if $playerdata['class'] == "melee"
          $playerdata['weapon'] = "The Horseman's Blade"
          $playerdata['math']['dmg'] = 150
        elsif $playerdata['class'] == "ranged"
          $playerdata['weapon'] = "Sniper Rifle"
          $playerdata['math']['dmg'] = 185
        elsif $playerdata['class'] == "summoner"
          $playerdata['weapon'] = "Kaleidoscope"
          $playerdata['math']['dmg'] = 180
        end
      elsif $intid == "golem"
        if $playerdata['class'] == "melee"
          $playerdata['weapon'] = "Flying Dragon"
          $playerdata['math']['dmg'] = 180
        elsif $playerdata['class'] == "magic"
          $playerdata['weapon'] = "Staff of Earth"
          $playerdata['math']['dmg'] = 125
        end
      elsif $intid == "moonlord"
        if $playerdata['class'] == "melee"
          $playerdata['weapon'] = "Meowmere"
          $playerdata['math']['dmg'] = 200
        elsif $playerdata['class'] == "magic"
          $playerdata['weapon'] = "Nebula Blaze"
          $playerdata['math']['dmg'] = 130
        end
      end
      File.write('./boss-and-player-data/playerdata.yml', $playerdata.to_yaml)
      sleep(0.5)
      puts "Returning to Main Menu."
      system('ruby MainMenu.rb')
    else
      sleep(3)
      bossturn()
    end
  elsif decision == "2" || decision == "h" || decision == "heal"
    sleep(0.5)
    puts "You drank a health potion..."
    if $hp == $maxhp
      sleep(0.5)
      puts "...but you didn't gain any health back"
    else
      $hp += $potionheal
      if $hp >= $maxhp
        $hp = $maxhp
        sleep(0.5)
        puts "...and your health was fully restored!"
      else
        sleep(0.5)
        puts "...and your health was restored by #{$potionheal}"
      end
    end
    sleep(3)
    bossturn()
  else
    puts "You were too scared to move..."
    sleep(3)
    bossturn()
  end
end

def bossturn
  system('clear')
  puts "#{$name}'s Turn:"
  if $forms == 2
    if $bosshp <= $formswitch
      bossattack = rand(1..$attacks)
      hitamount = rand(1..4)
      if hitamount == 1
        bossdamage = (($bossdata['form2']["atk#{bossattack}"] - ($def * 0.5)).floor / 2).floor
        $hp -= bossdamage
        sleep(0.5)
        puts "#{$name} launches an attack at you..."
        sleep(2)
        puts "... and the attack grazes you."
        sleep(0.5)
        puts "You lost #{bossdamage} health..."
      elsif hitamount == 2
        bossdamage = ($bossdata['form2']["atk#{bossattack}"] - ($def * 0.5)).floor
        $hp -= bossdamage
        sleep(0.5)
        puts "#{$name} launches an attack at you..."
        sleep(2)
        puts "... and the attack lands."
        sleep(0.5)
        puts "You lost #{bossdamage} health..."
      elsif hitamount == 3
        sleep(0.5)
        puts "#{$name} launches an attack at you..."
        sleep(2)
        puts "... and the attack ENTIRELY MISSES!"
        sleep(0.5)
        puts "You got very lucky!"
      elsif hitamount == 4
        bossdamage = (($bossdata['form2']["atk#{bossattack}"] - ($def * 0.5)).floor * 1.5).floor
        $hp -= bossdamage
        sleep(0.5)
        puts "#{$name} launches an attack at you..."
        sleep(2)
        puts "... and the attack lands critically."
        sleep(0.5)
        puts "You lost #{bossdamage} health..."
      end
    else
      bossattack = rand(1..$attacks)
      hitamount = rand(1..4)
      if hitamount == 1
        bossdamage = (($bossdata['form2']["atk#{bossattack}"] - ($def * 0.5)).floor / 2).floor
        $hp -= bossdamage
        sleep(0.5)
        puts "#{$name} launches an attack at you..."
        sleep(2)
        puts "... and the attack grazes you."
        sleep(0.5)
        puts "You lost #{bossdamage} health..."
      elsif hitamount == 2
        bossdamage = ($bossdata['form2']["atk#{bossattack}"] - ($def * 0.5)).floor
        $hp -= bossdamage
        sleep(0.5)
        puts "#{$name} launches an attack at you..."
        sleep(2)
        puts "... and the attack lands."
        sleep(0.5)
        puts "You lost #{bossdamage} health..."
      elsif hitamount == 3
        sleep(0.5)
        puts "#{$name} launches an attack at you..."
        sleep(2)
        puts "... and the attack ENTIRELY MISSES!"
        sleep(0.5)
        puts "You got very lucky!"
      elsif hitamount == 4
        bossdamage = (($bossdata['form2']["atk#{bossattack}"] - ($def * 0.5)).floor * 1.5).floor
        $hp -= bossdamage
        sleep(0.5)
        puts "#{$name} launches an attack at you..."
        sleep(2)
        puts "... and the attack lands critically."
        sleep(0.5)
        puts "You lost #{bossdamage} health..."
      end
    end
  else
    bossattack = rand(1..$attacks)
    hitamount = rand(1..4)
    if hitamount == 1
      bossdamage = (($bossdata['form1']["atk#{bossattack}"] - ($def * 0.5)).floor / 2).floor
      $hp -= bossdamage
      sleep(0.5)
      puts "#{$name} launches an attack at you..."
      sleep(2)
      puts "... and the attack grazes you."
      sleep(0.5)
      puts "You lost #{bossdamage} health..."
    elsif hitamount == 2
      bossdamage = ($bossdata['form1']["atk#{bossattack}"] - ($def * 0.5)).floor
      $hp -= bossdamage
      sleep(0.5)
      puts "#{$name} launches an attack at you..."
      sleep(2)
      puts "... and the attack lands."
      sleep(0.5)
      puts "You lost #{bossdamage} health..."
    elsif hitamount == 3
      sleep(0.5)
      puts "#{$name} launches an attack at you..."
      sleep(2)
      puts "... and the attack ENTIRELY MISSES!"
      sleep(0.5)
      puts "You got very lucky!"
    elsif hitamount == 4
      bossdamage = (($bossdata['form1']["atk#{bossattack}"] - ($def * 0.5)).floor * 1.5).floor
      $hp -= bossdamage
      sleep(0.5)
      puts "#{$name} launches an attack at you..."
      sleep(2)
      puts "... and the attack lands critically."
      sleep(0.5)
      puts "You lost #{bossdamage} health..."
    end
  end
  if $hp <= 0
    system('clear')
    sleep(0.5)
    puts "You were slain by #{$name}..."
    exit
  else
    sleep(3)
    system('clear')
    playerturn()
  end
end

def start
  system('clear')
  wbaif()
  varset()
  if $currentboss == "eyeocthulhu"
    puts "You feel an evil presence watching you..."
    sleep(1)
  elsif $currentboss == "eaterofworlds"
    puts "Screams echo around you..."
    sleep(1)
  elsif $currentboss == "brainofcthulhu"
    puts "A horrible chill goes down your spine..."
    sleep(1)
  elsif $currentboss == "skeletron"
    puts "Old Man was slain..."
    sleep(1)
  elsif $currentboss == "wallofflesh"
    puts "Andrew the Guide was slain..."
    sleep(1)
  elsif $currentboss == "thetwins"
    puts "This is going to be a terrible night..."
    sleep(1)
  elsif $currentboss == "thedestroyer"
    puts "You feel vibrations from deep below..."
    sleep(1)
  elsif $currentboss == "skeletronprime"
    puts "The air is getting colder around you..."
    sleep(1)
  elsif $currentboss == "mechdusa"
    puts "You see the defeated mechanical bosses reconstruct themselves and construct a new mech..."
    sleep(0.5)
    puts "You fear for your life..."
    sleep(1)
  elsif $currentboss == "moonlord"
    puts "Impending doom approaches..."
    sleep(1)
  elsif $currentboss == "ocram"
    puts "The final battle awaits..."
    sleep(1)
  end
  sleep(0.5)
  puts "#{$name} has awoken!"
  if $weapon == "Grenade"
    sleep(0.5)
    puts "You have Grenades which do #{$dmg} damage."
  else
    sleep(0.5)
    puts "You have a #{$weapon} which does #{$dmg} damage."
  end
  playerturn()
end

start()