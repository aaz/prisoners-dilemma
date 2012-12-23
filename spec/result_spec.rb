require 'round'
require_relative "../players/random_player"

describe 'An array of Results stored in arbitrary order' do
  it 'should be returned in order of score when the array is sorted' do
    fifty = Result.new(RandomPlayer.new, 50)
    thirty = Result.new(RandomPlayer.new, 30)
    twenty = Result.new(RandomPlayer.new, 20)
    another_thirty = Result.new(RandomPlayer.new, 30)
    
    results = [thirty, fifty, twenty, another_thirty]
    results.sort!

    total = results.first.total
    results.each do |result|
      result.total.should be <= total
      total = result.total
    end
  end
end