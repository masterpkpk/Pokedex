ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
configure :development do
  set :database, 'sqlite3:db/development.sqlite'
end

require 'net/http'
require 'open-uri'
require 'json'
require_relative "../app/models/Api.rb"
require './app/controllers/application_controller'
require './app/controllers/pokedex_controller'
require './app/controllers/pokemon_controller'
require './app/controllers/trainer_controller'
require_all 'app'
