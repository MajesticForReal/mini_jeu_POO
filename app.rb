require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("Jose")

while player1.life_points > 0 && player2.life_points > 0
		puts "\n"
		puts "Voici l'etat de chaque joueur :"
		player1.show_state
		puts "\n"
		player2.show_state
		puts "\n"
		puts "\n"
		puts "Passons a la phase d'attaque :"
		player1.attack(player2)
		if player2.life_points <= 0
			break
		end
		player2.attack(player1)
end
