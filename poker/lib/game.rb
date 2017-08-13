require_relative 'deck'
require_relative 'player'

class Game

  def initialize(*player_names)
    @deck = Deck.new
    @players = player_names.map { |player_name| Player.new(player_name) }
  end

  def play
    @deck.shuffle!
    deal_to_five
    discard_round
    deal_to_five
    display_results
  end

  def deal_to_five
    @players.each { |player| player.draw_to(5, @deck) }
  end

  def discard_round
    @players.each do |player|
      player.select_cards
      player.discard_selected
    end
  end

  def winners
    winners = [@players.first]
    @players[1..-1].each do |player|
      if player.hand > winners[0].hand
        winners = [player]
      elsif player.hand == winners[0].hand
        winners << player
      end
    end
    winners
  end

  def display_results
    winners.each do |winner|
      puts "Congratulations #{winner.name} you win the hand with:"
      winner.render_hand
    end
  end

end

Game.new('player1', 'player2', 'player3').play
