require_relative '../lib/tennis'

describe 'Tennis' do 

  it "initialize a game with player1's game scores being 0" do
    expect(Tennis.new.game_score[:player1]).to eq(0)
  end

  it "initialize a game with player2's game scores being 0" do
    expect(Tennis.new.game_score[:player2]).to eq(0)
  end

  it 'shows the game score of a new game' do
    tennis = Tennis.new
    expect(tennis.show_score).to eq("Player 1: 0 - 0 :Player 2")
  end

  it 'increases score when a player wins a point to 15-0' do
    tennis = Tennis.new
    tennis.win_point('Player 1')
    expect(tennis.game_score[:player1]).to eq(15)
  end

  it 'shows the game score as 15 - 0 after player 1 wins a point' do
    tennis = Tennis.new
    tennis.win_point('Player 1')
    expect(tennis.show_score).to eq("Player 1: 15 - 0 :Player 2")
  end

  it 'shows the game score as 30 - 0 after player 2 wins 2 points' do
    tennis = Tennis.new
    tennis.win_point('Player 1')
    tennis.win_point('Player 1')
    expect(tennis.show_score).to eq("Player 1: 30 - 0 :Player 2")
  end

  it 'shows the game score as 40 - 0 after player 2 wins 2 points' do
    tennis = Tennis.new
    tennis.win_point('Player 1')
    tennis.win_point('Player 1')
    tennis.win_point('Player 1')
    expect(tennis.show_score).to eq("Player 1: 40 - 0 :Player 2")
  end

end