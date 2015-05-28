require 'sinatra'
require 'json'
load 'mediotiempo.rb'

get '/games' do
  content_type :json
  games = Mediotiempo.get_all_games
  games.to_json
end

get '/games/live' do
  content_type :json
  games = Mediotiempo.get_live_games
  games.to_json
end

get '/games/coming' do
  content_type :json
  games = Mediotiempo.get_coming_games
  games.to_json
end
