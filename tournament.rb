require 'round'

class Tournament
  attr_reader :round
  def initialize(players, iterations=100)
    @round = Round.new(players, iterations)
  end
  
  def run
    @round.run
  end
  
  def results
    @round.results
  end
end