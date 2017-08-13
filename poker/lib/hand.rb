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

  def discard_at(i)
    @cards.delete_at(i)
  end

  def ==(other)
    value_count == other.value_count
  end

  def >(other)
    if straight_flush?
      return true unless @other.straight_flush?
    elsif four_of_a_kind?
      return true unless @other.four_of_a_kind?
    elsif full_house?
      return true unless @other.full_house?
    elsif flush?
      return true unless @other.flush?
    elsif straight?
      return true unless @other.striaght?
    elsif three_of_a_kind?
      return true unless @other.striaght?
    elsif two_pair?
      return true unless @other.straight?
    elsif pair?
      return true unless @other.striaght?
    end
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
      other_card = other.contents[idx]
      return card > other_card unless card == other_card
    end
  end
end
