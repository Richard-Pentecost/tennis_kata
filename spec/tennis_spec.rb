require_relative '../lib/tennis'

describe 'Tennis' do 

  before(:each) do
   @tennis = Tennis.new
  end


  it "initialize a game with player1's game scores being 0" do
    expect(@tennis.game_score[:player1]).to eq(0)
  end

  it "initialize a game with player2's game scores being 0" do
    expect(@tennis.game_score[:player2]).to eq(0)
  end

  it 'shows the game score of a new game' do
    expect(@tennis.show_score).to eq("Player 1: 0 - 0 :Player 2")
  end

  it 'increases score when a player wins a point to 15-0' do
    @tennis.win_point('Player 1')
    expect(@tennis.game_score[:player1]).to eq(15)
  end

  player_1_wins_point = {
    one_point: { points_won: 1, score: "Player 1: 15 - 0 :Player 2" },
    two_points: { points_won: 2, score: "Player 1: 30 - 0 :Player 2" },
    three_points: { points_won: 3, score: "Player 1: 40 - 0 :Player 2" },
    four_points: { points_won: 4, score: "Player 1: 0 - 0 :Player 2" },
  }

  player_1_wins_point.each do |point, data| 
    it 'shows the correct score after player 1 wins points' do
      data[:points_won].times { @tennis.win_point('Player 1') }
      expect(@tennis.show_score).to eq(data[:score])
    end
  end

end