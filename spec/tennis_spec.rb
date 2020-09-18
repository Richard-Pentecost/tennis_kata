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
    expect(@tennis.show_game_score).to eq("Player 1: 0 - 0 :Player 2")
  end

  player_scores = {
    one_point: [1, 15],
    two_points: [2, 30],
    three_points: [3, 40],
    four_points: [4, 0],
  }

  player_scores.each do |point, data|
    it 'increases player 1 score when player 1 wins a point' do
      data[0].times { @tennis.win_point('Player 1') }
      expect(@tennis.game_score[:player1]).to eq(data[1])
    end
  end

  player_scores.each do |point, data|
    it 'increases player 2 score when player 2 wins a point' do
      data[0].times { @tennis.win_point('Player 2') }
      expect(@tennis.game_score[:player2]).to eq(data[1])
    end
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
      expect(@tennis.show_game_score).to eq(data[:score])
    end
  end

  player_2_wins_point = {
    one_point: { points_won: 1, score: "Player 1: 0 - 15 :Player 2" },
    two_points: { points_won: 2, score: "Player 1: 0 - 30 :Player 2" },
    three_points: { points_won: 3, score: "Player 1: 0 - 40 :Player 2" },
    four_points: { points_won: 4, score: "Player 1: 0 - 0 :Player 2" },
  }

  player_2_wins_point.each do |point, data|
    it 'shows the correct score after player 2 wins points' do
      data[:points_won].times { @tennis.win_point('Player 2') }
      expect(@tennis.show_game_score).to eq(data[:score])
    end
  end

  it 'initialize the game with the players set scores being 0' do
    expect(@tennis.set_score[:player1]).to eq(0)
    expect(@tennis.set_score[:player2]).to eq(0)
  end

  it 'when player1 wins a game, there set score increases' do
    4.times { @tennis.win_point('Player 1') }
    expect(@tennis.set_score[:player1]).to eq(1)
  end

  it 'when player2 wins a game, there set score increases' do
    4.times { @tennis.win_point('Player 2') }
    expect(@tennis.set_score[:player2]).to eq(1)
  end

end