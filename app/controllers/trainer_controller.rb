require "./config/environment"

class TrainerController < ApplicationController

  get '/signup' do
    erb :'trainer/signup'
  end

  post "/signup" do 
    @trainer = Trainer.create(username: params[:username], password: params[:password])
    session[:user_id] = @trainer.id
    redirect "/index"
  end

  get '/login' do
    erb :'trainer/login'
  end

  post "/login" do
    user = Trainer.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/index"
    else
      redirect "/"
    end
  end

  post "/logout" do
    session.clear
    redirect "/"
  end

  get "/home" do
    @trainer = current_user
    if logged_in?
      erb :'trainer/home'
    else
      redirect "/"
    end
  end

  post "/delete/:user_id" do
    Trainer.destroy(params[:user_id])
    redirect '/'
  end
  
end