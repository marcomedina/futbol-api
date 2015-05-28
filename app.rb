require 'sinatra'
require 'json'
load 'mediotiempo.rb'

get '/games' do
  content_type :json
  games = Mediotiempo.get_live_games
  games.to_json
end
