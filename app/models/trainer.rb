class Trainer < ActiveRecord::Base
  has_secure_password
  has_many :pokedexes
  has_many :pokemon, through: :pokedexes

end
