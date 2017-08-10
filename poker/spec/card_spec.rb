require 'rspec'
require 'card'

describe Card do

  subject(:card) { Card.new(7, :spade) }
  describe '#initialize' do
    it 'initializes with a value' do
      expect(card.value).to eq(7)
    end
    it 'initialized with a suit' do
      expect(card.suit).to eq(:spade)
    end
  end

  describe '#reveal' do
    it 'returns a string with the value and suit' do
      expect(card.reveal).to eq('7♠')
    end
  end

end
