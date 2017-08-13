require_relative 'cursor'
require_relative 'hand'
require_relative 'deck'

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
        print card.to_s.colorize(:background => :dark_blue)
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

  def draw_cards(deck, count = 1)
    raise 'EMPTY DECK' if deck.cards.empty?
    count.times { @hand.give(deck.cards.shift) }
  end


end
