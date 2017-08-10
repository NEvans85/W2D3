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
end
