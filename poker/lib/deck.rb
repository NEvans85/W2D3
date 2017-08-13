require_relative 'card'

class Deck
  attr_accessor :cards, :size
# TODO: harden instance variables
  def initialize
    @cards = standard_deck
  end

  def standard_deck
    deck = []
    suits = %i[heart diamond spade club]
    suits.each do |suit|
      (2..14).each { |i| deck << Card.new(i, suit) }
    end
    deck
  end

  def shuffle!
    @cards.shuffle!
  end
  
end
