require "./config/environment"

class PokemonController < ApplicationController
  get "/" do
    if Pokemon.all.size == 0
      Api.new.pokemon_creator 
    else
      erb :welcome 
    end
  end

  get "/index" do
    @trainer = current_user
    if logged_in?
      erb :'pokemon/index'
    else
      redirect "/"
    end
  end
end