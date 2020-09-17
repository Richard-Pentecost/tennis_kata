class Tennis
  attr_accessor :game_score

  def initialize
    @game_score = { player1: 0, player2: 0}
  end

  def show_score
    "Player 1: #{@game_score[:player1]} - 0 :Player 2"
  end

  def win_point(player)
    score = @game_score[:player1]
    case score
    when 0, 15 
        @game_score[:player1] = score + 15
    when 30
        @game_score[:player1] = score + 10
    else
        @game_score[:player1] = 0
    end
  end
end