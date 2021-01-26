class Player
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		print "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage(number_of_damage)
		@life_points = @life_points - number_of_damage.to_i

		if @life_points <= 0
			puts "Le joueur #{@name} a ete tue !"
		end
	end

	def attack(player_attacked)
		puts "Le joueur #{@name} attaque le joueur #{player_attacked.name} !"
		damage = compute_damage
		puts "Il lui inflige #{damage} points de dommages !"
		player_attacked.gets_damage(damage)
	end

	def compute_damage
		return rand(1..6)
	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@weapon_level = 1
		super(name)
		@life_points = 100

	end

	def show_state
		super 
		puts "#{@show_state} et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
		super * @weapon_level
	end

	def search_weapon
		new_weapon = rand(1..6)
		puts "Tu as trouve une arme de niveau #{new_weapon} !"
		if @weapon_level < new_weapon
			@weapon_level = new_weapon
			puts "Youhou ! Elle est meilleure que ton arme actuelle : Tu la prends."
		else puts "M@*#$... Elle n'est pas mieux que ton arme actuelle.."
		end
	end

	def search_health_pack
		@health_pack = rand(1..6)
		if @health_pack == 1
			puts "Tu n'as rien trouvé... "
		elsif @health_pack >= 2 && @health_pack <= 5
			@health_pack = 50
			@life_points = @life_points + @health_pack
			if @life_points > 100
				@life_points = 100
			end
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
		elsif @health_pack == 6
			@health_pack = 80
			@life_points += @health_pack
			if @life_points > 100
				@life_points = 100
			end
			puts "Waow, tu as trouvé un pack de +80 points de vie !"
		end
	end
end
