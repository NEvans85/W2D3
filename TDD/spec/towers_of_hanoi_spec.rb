require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe '#initialize' do
    it "initializes a board array with three arrays" do
      expect(game.board).to be_a(Array)
      expect(game.board.length).to eq(3)
      expect(game.board.all? {|ele| ele.is_a?(Array)}).to be true
    end

    it "populates the board with 3 discs" do
      expect(game.board.flatten.length).to eq(3)
    end

    it "discs start on a single stack" do
      expect(game.board.any? {|peg| peg.length == 3}).to be(true)
    end
  end

  describe '#won?' do
    it 'returns true when the second or third tower has 3 elements'
    it 'returns true only when the discs are in ascending order'

  end

  describe 'make_move' do
    it 'removes a disc from the first chosen tower'
    it 'adds a disc to the destination tower'
    it 'returns nil if move is invalid'
  end
  
  describe '#play' do
    it "calls the make move method" do
      expect(game).to receive(:make_move)
      game.play
    end

    it "prints a congratulatory message when the game is won" do

    end
  end


end
