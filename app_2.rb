require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-" * 63
puts "|              Bienvenue dans mon Battle Royal !              |"
puts "| Ta mission si tu l'accepte est d'etre le dernier survivant !|"
puts "|           Si tu a trop peur appuie sur CTRL + C !           |"
puts "-" * 63
puts "\n"

puts "Nom du joueur :"
print "> "
p1 = HumanPlayer.new(gets.chomp)
puts "\n"

p2 = Player.new("Josiane")
p3 = Player.new("Jose")
ennemi = [p2, p3]
	
while p1.life_points > 0 && (p2.life_points > 0 || p3.life_points > 0)
	p1.show_state
	puts "Quelle action veux-tu effectuer ?"
	puts "\n"
	puts "a - Chercher une meilleure arme"
	puts "s - Chercher à se soigner "
	puts "\n"
	puts "Attaquer un joueur en vue :"
	puts "0 - Josiane a #{p2.life_points} points de vie"
	puts "1 - José a #{p3.life_points} points de vie"
	puts "\n"

	print "> "
	reply = gets.chomp
	puts "\n"
		if reply == "a"
			p1.search_weapon
			puts "\n"
		elsif reply == "s"
			p1.search_health_pack
			puts "\n"
		elsif reply == "0"
		  puts "Lancement de la phase d'attaque :"
			p1.attack(p2)
			if p2.life_points > 0
				puts "Josiane n'a plus que #{p2.life_points} points de vie"
			end
			puts "\n"
		elsif reply == "1"
		  puts "Lancement de la phase d'attaque :"
			p1.attack(p3)
			if p3.life_points > 0
				puts "José n'a plus que #{p3.life_points} points de vie"
			end
			puts "\n"
		elsif
			while reply != "a" || reply != "s" || reply != "0" || reply != "1"
				puts "Ce n'est pas dans les propositions l'ami !"
				print"> "
				reply = gets.chomp
				puts "\n"
					if reply == "a"
						p1.search_weapon
						puts "\n"
					break
					elsif reply == "s"
						p1.search_health_pack
						puts "\n"
					break
					elsif reply == "0"
		  			puts "Lancement de la phase d'attaque :"
						p1.attack(p2)
						if p2.life_points > 0
							puts "Josiane n'a plus que #{p2.life_points} points de vie"
						end
						puts "\n"
						break
					elsif reply == "1"
		  			puts "Lancement de la phase d'attaque :"
						p1.attack(p3)
						if p3.life_points > 0
							puts "José n'a plus que #{p3.life_points} points de vie"
						end
						puts "\n"
						break
					end
			end
			end

	puts "Les autres joueurs t'attaquent !"
	puts "\n"

	ennemi.each do |i|
		if i.life_points <= 0
			next
		end
		i.attack(p1)
		if p1.life_points > 0
			puts "#{p1.name} n'a plus que #{p1.life_points} points de vie !"
			puts "\n"
		end
	end
	if p2.life_points <= 0 && p3.life_points <= 0
		puts "Mais ils sont tous morts !"
		next
	end
	if p1.life_points <= 0
		next
	end

	puts "Continue ? [y/n]"
	print "> "
	nxt = gets.chomp
	puts "\n"
	if nxt == "y"
		next
	elsif nxt == "n"
	 exit
	end
	while nxt != "y" || nxt != "n"
		puts "J'ai dis [y ou n] frero fais un effort stp !"
		print"> "
		nxt = gets.chomp
		puts "\n"
		if nxt == "n"
			exit
		elsif nxt == "y"
			break
		end
	end
end

puts "\n"
puts "La partie est finie"
if p1.life_points > 0
	puts "BRAVO ! TU AS GAGNE !"
elsif p1.life_points <= 0
	puts "Loser ! Tu as perdu !"
end
