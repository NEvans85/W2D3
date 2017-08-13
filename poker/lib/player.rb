require_relative 'cursor'
require_relative 'hand'
require_relative 'deck'
require 'colorize'

class Player
  attr_accessor :hand
  attr_reader :name

  def initialize(name)
    @name = name
    @hand = Hand.new
    @cursor = Cursor.new(0)
  end

  def render_hand
    system 'clear'
    @hand.cards.each_with_index do |card, idx|
      print '|'
      if @cursor.pos == idx
        print card.to_s.colorize(:background => :light_blue)
      elsif card.selected?
        print card.to_s.colorize(:background => :blue)
      else
        print card.to_s
      end
      print '|'
    end
    print "\n"
  end

  def select_cards
    input = nil
    until input == :stop
      render_hand
      input = @cursor.get_input
      @hand.cards[input].toggle_select if input.is_a?(Integer)
    end
  end

  def discard_selected
    @hand.discard_selected
  end

  def draw_card_from(deck)
    raise 'EMPTY DECK' if deck.cards.empty?
    @hand.give(deck.cards.shift)
  end

  def draw_to(size, deck)
    draw_card_from(deck) until @hand.size == size
  end


end
