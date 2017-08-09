class TowersOfHanoi
  attr_reader :board

  def initialize
    @board = Array.new(3) {[]}
    @board[0] = [1, 2, 3]
  end

  def play
    puts "Where from?"
    from = gets.chomp
    puts "Where to?"
    to = gets.chomp

    make_move(from, to)
  end

  def make_move(from, to)
    
  end
end
