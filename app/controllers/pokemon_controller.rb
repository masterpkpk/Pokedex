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
    binding.pry
    
    erb :'pokemon/show'
  end
end