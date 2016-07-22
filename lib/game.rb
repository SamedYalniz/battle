require_relative "player"

class Game
  attr_reader :attack, :first_player, :second_player, :current_turn

  def initialize(first_player = Player.new, second_player = Player.new)
    @first_player = first_player
    @second_player = second_player
    @players  = [first_player, second_player]
    @current_turn = @first_player
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turns
    @current_turn = opposite_of(@current_turn)
  end
  private
  def opposite_of(current_turn)
    @players.select { |player| player != current_turn }.first
  end

  def self.start_game(first_player, second_player)
    @game = Game.new(first_player, second_player)
  end

  def self.game
    @game
  end
end
