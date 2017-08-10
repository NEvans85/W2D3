require_relative 'card'

class Deck
  attr_accessor :contents, :size
# TODO: harden instance variables
  def initialize
    @contents = standard_deck
  end

  def standard_deck
    deck = []
    suits = [:heart, :diamond, :spade, :club]
    suits.each do |suit|
      (1..13).each { |i| deck << Card.new(i, suit) }
    end
    deck
  end

  def shuffle!
    @contents.shuffle!
  end

  def draw_card
    raise 'EMPTY DECK' if @contents.empty?
    @contents.shift
  end
end
