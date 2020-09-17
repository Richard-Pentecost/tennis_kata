require_relative '../lib/tennis'

describe 'Tennis' do 
  it "initialize a game with player1's game scores being 0" do
    expect(Tennis.new.game_score[:player1]).to eq(0)
  end

  it "initialize a game with player2's game scores being 0" do
    expect(Tennis.new.game_score[:player2]).to eq(0)
  end

  it 'shows this game score of the 2 players' do
    tennis = Tennis.new
    expect(tennis.show_score()).to eq("Player 1: #{tennis[:players1]} - #{tennis[:player2]} :Player 2")
  end

end