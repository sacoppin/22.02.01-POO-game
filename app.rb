require 'bundler'
Bundler.require

require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("Jose")

puts "=====================================\n\n"

puts "Voici l'état de chaque joueur :\n"
puts player1.show_state
puts player2.show_state

puts "=====================================\n\n"

puts "Passons à la phase d'attaque 🤺:\n\n"

player2.attacks(player1)
player1.attacks(player2)

puts "=====================================\n\n"
#while continue a executer tant que la condition reste juste
player2.attacks(player1)
while player1.life_points > 0 && player2.life_points > 0 do
#si l'un des deux meurt le jeu s'arrete
if player1.life_points <= 0
    puts "#{player1.name} a été tué !\n\n"
    break
    next
elsif player2.life_points <= 0
    puts "#{player2.name} a été tué !\n\n"
    break
    next
end
player1.attacks(player2)
end
puts "Game over💀 "

binding.pry