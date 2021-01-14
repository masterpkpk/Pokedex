require "./config/environment"

class TrainerController < ApplicationController

  get '/signup' do
    erb :'trainer/signup'
  end

  post "/signup" do 
    @trainer = Trainer.create(username: params[:username], password: params[:password])
    session[:user_id] = @trainer.id
    redirect "/trainer"
  end

  get '/login' do
    erb :'trainer/login'
  end

  post "/login" do
    user = Trainer.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/pokemons"
    else
      redirect "/"
    end
  end
  get "/logout" do
    session.clear
    redirect "/"
  end


  post "/logout" do
    session.clear
    redirect "/"
  end

  get "/trainer" do
    @trainer = current_user
    if logged_in? && @trainer.name == nil
      erb :'trainer/index'
    else
      redirect "/trainer/edit"
    end
  end

  post '/trainer' do
    @trainer = current_user
    @trainer.name = params[:name]
    @trainer.age = params[:age]
    @trainer.hometown = params[:hometown]
    @trainer.save
    redirect '/pokemons'
    
  end
  get '/trainer/edit' do
    @trainer = current_user
    if logged_in? && @trainer.name != nil
      erb :'trainer/edit'
    else
      redirect '/pokemons'
    end
  
  end
  
  patch '/trainer/edit' do
    @trainer = current_user
    @trainer.name = params[:name]
    @trainer.age = params[:age]
    @trainer.hometown = params[:hometown]
    @trainer.save
    redirect '/pokemons'
  end

  delete "/delete/:user_id" do
    Trainer.destroy(params[:user_id])
    redirect '/'
  end


  
end

#index to pokemons
#show route for individual pokeon
#edit form for trainer to change username or something
#validate presense of nickname 