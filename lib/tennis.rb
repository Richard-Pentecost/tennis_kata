class Tennis
  attr_accessor :game_score
  attr_accessor :set_score

  def initialize
    @game_score = { player1: 0, player2: 0 }
    @set_score = { player1: 0, player2: 0 }
  end

  def show_game_score
    "Player 1: #{@game_score[:player1]} - #{@game_score[:player2]} :Player 2"
  end

  def win_point(player)
    player == 'Player 1' ? winner = :player1 : winner = :player2
    score = @game_score[winner]
    case score
    when 0, 15 
        @game_score[winner] = score + 15
    when 30
        @game_score[winner] = score + 10
    else
        @set_score[winner] = 1
        @game_score[winner] = 0
    end
  end
end