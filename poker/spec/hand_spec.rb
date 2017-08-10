require 'rspec'
require 'hand'

describe Hand do
  subject(:hand) { Hand.new }
  let(:card) { double("card") }

  describe '#initialize' do
    it 'creates an empty array to store cards' do
      expect(hand.contents).to be_empty
    end
  end

  describe '#give' do
    it 'adds the given card to its contents' do
      hand.give(card)
      expect(hand.contents).to eq([card])
    end
  end

  describe '#take' do
    before(:each) { hand.give(card) }
    it 'removes a card from the hand at the given index' do
      hand.take(0)
      expect(hand.contents).to be_empty
    end
  end

  describe '#score' do
    let(:card1) { double("card", :value => 10, :suit => :club ) }
    let(:card2) { double("card", :value => 9, :suit => :club ) }
    let(:card3) { double("card", :value => 8, :suit => :club ) }
    let(:card4) { double("card", :value => 7, :suit => :club ) }
    let(:card5) { double("card", :value => 6, :suit => :club ) }
    before(:each) do
      hand.give(card1)
      hand.give(card2)
      hand.give(card3)
      hand.give(card4)
      hand.give(card5)
    end
    context "returns an array with the hand rank and the cards in the hand" do
      it "correctly scores a straight flush" do
        expect(hand.score).to eq([1, [card1, card2, card3, card4, card5]])
      end
      it "correctly scores a straight" do
        card1.suit = :heart
        expect(hand.score).to eq([5, [card1, card2, card3, card4, card5]])
      end
    end


  end
end
