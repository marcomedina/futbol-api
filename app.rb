require 'sinatra'
require 'json'
load 'mediotiempo.rb'

before do
  content_type :json, charset: 'utf-8'
end

get '/games' do
  games = Mediotiempo.get_all_games
  games.to_json
end

get '/games/live' do
  games = Mediotiempo.get_live_games
  games.to_json
end

get '/games/coming' do
  games = Mediotiempo.get_coming_games
  games.to_json
end
