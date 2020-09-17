require_relative '../lib/tennis'

describe Tennis do 
  it 'should test methods in tennis.rb' do
    expect(Tennis.some_method).to eq('success')
  end
end