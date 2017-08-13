require_relative 'cursor'
require_relative 'hand'

class Player
  attr_accessor :hand
  attr_reader :name

  def initialize(name)
    @name = name
    @hand = Hand.new
  end

  def display_hand
    cursor = Cursor.new(0)
    
  end


end
