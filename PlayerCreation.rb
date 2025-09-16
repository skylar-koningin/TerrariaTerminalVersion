require 'yaml'
$playerdata = YAML.load_file('./boss-and-player-data/playerdata.yml')

system('clear')
sleep(0.5)
puts "Welcome to the Character Creation!"
puts ""
sleep(0.5)
puts "First, What is your name?"
name = gets.chomp
$playerdata['name'] = name
puts ""
sleep(0.5)
puts "Second, what class do you want to use?"
sleep(0.5)
puts "Melee; Ranged; Magic; Summoner"
classed = gets.chomp.downcase
$playerdata['class'] = classed
puts ""

if classed == "melee"
  $playerdata['weapon'] = "Arkhalis"
  $playerdata['math']['dmg'] = 25
  pillar1 = 1
elsif classed == "ranger"
  $playerdata['weapon'] = "Grenade"
  $playerdata['math']['dmg'] = 60
  pillar1 = 2
elsif classed == "magic"
  $playerdata['weapon'] = "Demon Scythe"
  $playerdata['math']['dmg'] = 35
  pillar1 = 3
elsif classed == "summoner"
  $playerdata['weapon'] = "Snapthorn"
  $playerdata['math']['dmg'] = 18
  pillar1 = 4
else
  puts "Try again..."
  classed = gets.chomp.downcase
  $playerdata['class'] = classed
  puts ""
end

$playerdata['math']['def'] = 20
$playerdata['math']['maxhp'] = 100
$playerdata['math']['potionheal'] = 50

feb = rand(1..2)
if feb == 1
  $playerdata['feb'] = "eaterofworlds"
else
  $playerdata['feb'] = "brainofcthulhu"
end

mech1 = rand(1..3)
mech2 = rand(1..2)
if mech1 == 1
  $playerdata['mechs']['thetwins'] = 1
  if mech2 == 1
    $playerdata['mechs']['thedestroyer'] = 2
    $playerdata['mechs']['skeletronprime'] = 3
  else
    $playerdata['mechs']['skeletronprime'] = 2
    $playerdata['mechs']['thedestroyer'] = 3
  end
elsif mech1 == 2
  $playerdata['mechs']['thedestroyer'] = 1
  if mech2 == 1
    $playerdata['mechs']['thetwins'] = 2
    $playerdata['mechs']['skeletronprime'] = 3
  else
    $playerdata['mechs']['skeletronprime'] = 2
    $playerdata['mechs']['thetwins'] = 3
  end
else
  $playerdata['mechs']['skeletronprime'] = 1
  if mech2 == 1
    $playerdata['mechs']['thetwins'] = 2
    $playerdata['mechs']['thedestroyer'] = 3
  else
    $playerdata['mechs']['thetwins'] = 2
    $playerdata['mechs']['thedestroyer'] = 3
  end
end

pillar2 = rand(1..3)
pillar3 = rand(1..2)
if pillar1 == 1
  $playerdata['pillars']['solar'] = 1
  if pillar2 == 1
    $playerdata['pillars']['nebula'] = 2
    if pillar3 == 1
      $playerdata['pillars']['vortex'] = 3
      $playerdata['pillars']['stardust'] = 4
    else
      $playerdata['pillars']['stardust'] = 3
      $playerdata['pillars']['vortex'] = 4
    end
  elsif pillar2 == 2
    $playerdata['pillars']['vortex'] = 2
    if pillar3 == 1
      $playerdata['pillars']['nebula'] = 3
      $playerdata['pillars']['stardust'] = 4
    else
      $playerdata['pillars']['stardust'] = 3
      $playerdata['pillars']['nebula'] = 4
    end
  else
    $playerdata['pillars']['stardust'] = 2
    if pillar3 == 1
      $playerdata['pillars']['nebula'] = 3
      $playerdata['pillars']['vortex'] = 4
    else
      $playerdata['pillars']['vortex'] = 3
      $playerdata['pillars']['nebula'] = 4
    end
  end
elsif pillar1 == 2
  $playerdata['pillars']['nebula'] = 1
  if pillar2 == 1
    $playerdata['pillars']['solar'] = 2
    if pillar3 == 1
      $playerdata['pillars']['vortex'] = 3
      $playerdata['pillars']['stardust'] = 4
    else
      $playerdata['pillars']['stardust'] = 3
      $playerdata['pillars']['vortex'] = 4
    end
  elsif pillar2 == 2
    $playerdata['pillars']['vortex'] = 2
    if pillar3 == 1
      $playerdata['pillars']['solar'] = 3
      $playerdata['pillars']['stardust'] = 4
    else
      $playerdata['pillars']['stardust'] = 3
      $playerdata['pillars']['solar'] = 4
    end
  else
    $playerdata['pillars']['stardust'] = 2
    if pillar3 == 1
      $playerdata['pillars']['solar'] = 3
      $playerdata['pillars']['vortex'] = 4
    else
      $playerdata['pillars']['vortex'] = 3
      $playerdata['pillars']['solar'] = 4
    end
  end
elsif pillar1 == 3
  $playerdata['pillars']['vortex'] = 1
  if pillar2 == 1
    $playerdata['pillars']['solar'] = 2
    if pillar3 == 1
      $playerdata['pillars']['nebula'] = 3
      $playerdata['pillars']['stardust'] = 4
    else
      $playerdata['pillars']['stardust'] = 3
      $playerdata['pillars']['nebula'] = 4
    end
  elsif pillar2 == 2
    $playerdata['pillars']['nebula'] = 2
    if pillar3 == 1
      $playerdata['pillars']['solar'] = 3
      $playerdata['pillars']['stardust'] = 4
    else
      $playerdata['pillars']['stardust'] = 3
      $playerdata['pillars']['solar'] = 4
    end
  else
    $playerdata['pillars']['stardust'] = 2
    if pillar3 == 1
      $playerdata['pillars']['solar'] = 3
      $playerdata['pillars']['nebula'] = 4
    else
      $playerdata['pillars']['nebula'] = 3
      $playerdata['pillars']['solar'] = 4
    end
  end
else
  $playerdata['pillars']['stardust'] = 1
  if pillar2 == 1
    $playerdata['pillars']['solar'] = 2
    if pillar3 == 1
      $playerdata['pillars']['nebula'] = 3
      $playerdata['pillars']['vortex'] = 4
    else
      $playerdata['pillars']['vortex'] = 3
      $playerdata['pillars']['nebula'] = 4
    end
  elsif pillar2 == 2
    $playerdata['pillars']['nebula'] = 2
    if pillar3 == 1
      $playerdata['pillars']['solar'] = 3
      $playerdata['pillars']['vortex'] = 4
    else
      $playerdata['pillars']['vortex'] = 3
      $playerdata['pillars']['solar'] = 4
    end
  else
    $playerdata['pillars']['vortex'] = 2
    if pillar3 == 1
      $playerdata['pillars']['solar'] = 3
      $playerdata['pillars']['nebula'] = 4
    else
      $playerdata['pillars']['nebula'] = 3
      $playerdata['pillars']['solar'] = 4
    end
  end
end

File.write('./boss-and-player-data/playerdata.yml', $playerdata.to_yaml)

sleep(0.5)
puts "Would you like to start playing now?"
answer = gets.chomp.downcase
if answer == "yes" || answer == "y"
  system('ruby Battle.rb')
else
  exit
end