require "./config/environment"

class PokemonController < ApplicationController
  get "/" do
   erb :welcome 
  end

  get "/pokemons" do
    @trainer = current_user
    if logged_in?
      erb :'pokemon/pokemons'
    else
      redirect "/"
    end
  end

  get '/pokemon' do
    @trainer = current_user
    if logged_in?
      erb :'pokemon/index'
    else
      redirect "/"
    end
    
  end

  get '/pokemons/:id' do
    @pokemon = Pokemon.find_by_id(params[:id])
    erb :'pokemon/show'

  end

  post '/pokemon/new' do
    @pokemon = Pokemon.find_by_id(params['pokemon'])
    @trainer = current_user
    @pokemon_trainer = PokemonTrainer.create(pokemon_id: @pokemon.id, trainer_id: @trainer.id, nickname: @pokemon.name)
    @pokemon.trainer_id = @pokemon_trainer.trainer_id
    redirect '/pokemons'
  end

  

 

  
end