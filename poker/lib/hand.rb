requrie_relative 'card'

class Hand

  attr_reader :contents

  def initialize
    @contents = []
  end

  def give(card)
    @contents << card
  end

  def take(i)
    @contents.delete_at(i)
  end

  def > (other)
    
  end

  def valid_hand?
    @contents.length == 5 && @contents.all? { |card| card.is_a?(Card) }
  end

  def value_count
    value_count = Hash.new(0)
    @content.each { |card| val_count[card.value] += 1 }
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
    @contents.all? { |card| card.suit == @contents[0].suit }
  end

  def straight?
    values = value_count.keys
    values.length == 5 && (values.max - values.min == 4 ||
                           values.sort == [1, 10, 11, 12, 13])
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

  def high_card?
    !(pair? || straight? || flush?)
  end
end
