class Tennis
  attr_accessor :game_score

  def initialize
    @game_score = { player1: 0, player2: 0}
  end

  def show_score
    "Player 1: #{@game_score[:player1]} - 0 :Player 2"
  end

  def win_point(player)
    @game_score[:player1] = 15
  end
end