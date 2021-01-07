require "./config/environment"

class PokemonController < ApplicationController
  get "/" do
   erb :welcome 
  end

  get "/index" do
    @trainer = current_user
    if logged_in?
      erb :'pokemon/index'
    else
      redirect "/"
    end
  end

  post '/pokemon/new' do
    @pokemon = Pokemon.find_by_id(params['pokemon'])
    @trainer = current_user
    @pokemon_trainer = PokemonTrainer.create(pokemon_id: @pokemon.id, trainer_id: @trainer.id)
    binding.pry
    erb :'pokemon/show'
  end
end