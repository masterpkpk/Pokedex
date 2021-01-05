require "./config/environment"

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, "public"
    set :views, "app/views"
    set :session_secret, "hotdog"
  end

  get "/" do
    Api.new.pokemon_creator
    erb :welcome 
  end

  get '/signup' do
    erb :signup
  end

  post "/signup" do 
    @trainer = Trainer.create(username: params[:username], password: params[:password])
    session[:user_id] = @trainer.id
    redirect "/home"
  end 

  get '/login' do
    erb :login
  end

  post "/login" do
    user = Trainer.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
     
      redirect "/home"
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
      erb :home
      
    else
      redirect "/"
    end
  end

  post "/delete/:user_id" do
    Trainer.destroy(params[:user_id])
    redirect '/'
   
  end


  helpers do
    def current_user
      @current_user ||= Trainer.find_by_id(session[:user_id])
    end

    def logged_in?
      current_user != nil
    end
  end





end
