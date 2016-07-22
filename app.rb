require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/names'do
    second_player = Player.new(params[:second_player])
    first_player = Player.new(params[:first_player])
   @game = Game.start_game(first_player, second_player)
    redirect '/play'
  end
  before  do
    @game = Game.game
  end
  get '/play' do
    erb :play
  end

  get '/attack' do
    @game.attack(@game.switch_turns)
    @game.switch_turns
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
