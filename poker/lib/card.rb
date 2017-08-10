class Card
  attr_reader :suit, :value

  VAL_DISPLAY_HASH = { 1 => 'A', 2 => '2', 3 => '3',
                       4 => '4', 5 => '5', 6 => '6',
                       7 => '7', 8 => '8', 9 => '9',
                       10 => '10', 11 => 'J',
                       12 => 'Q', 13 => 'K' }.freeze

  SUIT_DISPLAY_HASH = { :heart => "♥", :spade => "♠",
                        :club => "♣", :diamond => "♦" }.freeze

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def reveal
    "#{VAL_DISPLAY_HASH[value]}#{SUIT_DISPLAY_HASH[suit]}"
  end

end
