require "pry"

class Player
  # Classe qui modélise un Joueur
  attr_accessor :name # nom du Joueur (String)
  attr_accessor :life_points # niveau de vie du Joueur (Integer)

    def initialize(name)
        @name = name 
        @life_points = 10 
    end

    def show_state
        puts " #{name} a #{life_points} points de vie."
    end

    def get_damage (damage_points)
        @life_points = life_points-damage_points
        if  life_points <= 0
            puts "#{name} est mort au combat"
        else
            puts "#{name} a #{life_points} points de vie" 
        end
    end

    def attacks(player)
        puts "#{self.name} attaque #{player.name}"
        hit = compute_damage
        player.get_damage(hit) #player2 reçoit des dommages
        puts "#{@name} lui inflige #{hit} points de dommages"
    end
        
    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
        @@all_users << self
    end
    def show_state
        puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
    end

    def get_damage(damage)
        @life_points -= damage
        if @life_points <= 0 
            return "Le joueur #{name} a été tué !"
        else @life_points > 0
            return " #{name} a #{life_points} points de vie"
        end
    end
end

#binding.pry