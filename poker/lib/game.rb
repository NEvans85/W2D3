class Game

  def initialize(*player_names)
    @deck = Deck.new
    @players = player_names.map { |player_name| Player.new(player_name) }
    @curr_player_idx = rand(@players.size)
  end

  def play
    deal_to_five
    discard_round
    deal_to_five
    determine_winners
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

  def determine_winners
    winners = [@players.first]
    @players[1..-1].each do |player|
      if player.hand > winner[0].hand
        winners = [player]
      elsif player.hand == winner[0].hand
        winners << player
      end
    end
    winners
  end

end
