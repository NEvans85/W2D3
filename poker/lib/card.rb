class Card
  attr_reader :suit, :value, :selected

  VAL_DISPLAY_HASH = { 14 => 'Ⓐ', 2 => '②', 3 => '③',
                       4 => '④', 5 => '⑤', 6 => '⑥',
                       7 => '⑦', 8 => '⑧', 9 => '⑨',
                       10 => '⑩', 11 => 'Ⓙ',
                       12 => 'Ⓠ', 13 => 'Ⓚ' }.freeze

  SUIT_DISPLAY_HASH = { heart: '♥', spade: '♤',
                        club: '♧', diamond: '♦' }.freeze

  def initialize(value, suit)
    @value = value
    @suit = suit
    @selected = false
  end

  def reveal
    "#{VAL_DISPLAY_HASH[value]} #{SUIT_DISPLAY_HASH[suit]}"
  end

  def toggle_select
    @selected ? @selected = false : @selected = true
  end

  def ==(other)
    value == other.value
  end

  def >(other)
    value > other.value
  end

  def <(other)
    value < other.value
  end

  def <=>(other)
    value <=> other.value
  end

  def inspect
    reveal
  end

end
