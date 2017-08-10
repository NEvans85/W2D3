require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe '#initialize' do
    it 'initializes a contents array of 52 cards' do
      expect(deck.contents.length).to eq(52)
    end
    it 'initializes only with unique cards' do
      expect(deck.contents).to eq(deck.contents.uniq)
    end
  end

  describe '#shuffle!' do
    it 'shuffles the deck' do
      expect(deck.contents.dup).not_to eq(deck.shuffle!)
    end
  end

  describe '#draw_card' do

    it "removes a card from the beginning of the deck" do
      deck.draw_card
      expect(deck.contents.length).to eq(51)
    end
    it "returns the removed card" do
      expect(deck.draw_card).to be_a(Card)
    end
    it "raises an error when the deck is empty" do
      deck.contents = []
      expect { deck.draw_card }.to raise_error("EMPTY DECK")
    end
  end
end
