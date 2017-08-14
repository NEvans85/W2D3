require_relative 'card'

class Hand

  attr_reader :cards

  def initialize
    @cards = []
  end

  def give(card)
    @cards << card
    @cards.sort!
  end

  def discard_selected
    @cards.delete_if(&:selected?)
  end

  def ==(other)
    value_count == other.value_count
  end

  def size
    @cards.size
  end

  def >(other)
    pair_hand = false
    if straight_flush?
      return true unless other.straight_flush?
    elsif four_of_a_kind?
      return true unless other.four_of_a_kind?
      pair_hand = true
    elsif full_house?
      return true unless other.full_house?
    elsif flush?
      return true unless other.flush?
    elsif straight?
      return true unless other.straight?
    elsif three_of_a_kind?
      pair_hand = true
      return true unless other.three_of_a_kind?
    elsif two_pair?
      pair_hand = true
      return true unless other.two_pair?
    elsif pair?
      pair_hand = true
      return true unless other.pair?
    end
    return best_pair > other.best_pair if pair_hand &&
                                          best_pair != other.best_pair
    better_high_card?(other)
  end

  def valid_hand?
    @cards.length == 5 && @cards.all? { |card| card.is_a?(Card) }
  end

  def value_count
    value_count = Hash.new(0)
    @cards.each { |card| value_count[card.value] += 1 }
    value_count
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    value_count.values.include?(4)
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    @cards.all? { |card| card.suit == @cards[0].suit }
  end

  def straight?
    values = value_count.keys
    values.length == 5 && (values.max - values.min == 4 ||
                           values.sort == [2, 3, 4, 5, 14])
  end

  def three_of_a_kind?
    value_count.values.include?(3)
  end

  def two_pair?
    value_count.values.count(2) == 2
  end

  def pair?
    value_count.values.include?(2)
  end

  def better_high_card?(other)
    @cards.reverse.each_with_index do |card, idx|
      other_card = other.cards.reverse[idx]
      return card > other_card unless card == other_card
    end
  end

  def best_pair
    card_count_tupples = value_count.to_a.sort { |k_v_pair| k_v_pair[1] }
    card_count_tupples.last[0]
  end
end
