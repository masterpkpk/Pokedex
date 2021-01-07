class PokemonTrainerController < ApplicationController
  post '/pokemon_trainer/:id' do 
    @pokemon_trainer = PokemonTrainer.find_by(trainer_id: current_user.id, pokemon_id: params["pokemon"])
    @pokemon_trainer.destroy
    redirect to '/index'
  end 

end
