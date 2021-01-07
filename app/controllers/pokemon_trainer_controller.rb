class PokemonTrainerController < ApplicationController
  post '/pokemon_trainer/:id' do 
    @pokemon_trainer = PokemonTrainer.find_by(trainer_id: current_user.id, pokemon_id: params["pokemon"])
    @pokemon_trainer.destroy
    redirect '/index'
  end 

  post '/pokemon_trainer/:id/edit' do
    @pokemon_trainer = PokemonTrainer.find_by(trainer_id: current_user.id, pokemon_id: params["pokemon"])
    
    @pokemon_trainer.nickname = params["name"]
    @pokemon_trainer.save
    
    redirect '/pokemon'
  end

end
