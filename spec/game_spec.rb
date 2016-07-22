require 'game'

describe Game do
  subject(:game) { described_class.new(first_player, second_player) }
  let(:first_player) { double :player }
  let(:second_player) { double :player }

  describe '#attack' do
    it "reduces the player's hp" do
      expect(second_player).to receive(:receive_damage)
      game.attack(second_player)
    end
  end
  describe '#turns' do
    it "starts with player one's turn" do
      expect(game.current_turn).to eq first_player
    end
    it "switches turn after attack" do
      game.switch_turns
      expect(game.current_turn).to eq second_player
    end
  end
end
