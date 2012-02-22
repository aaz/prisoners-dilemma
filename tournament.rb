require_relative 'contest'

class Tournament
  def initialize(players)
    @players = players
    @contests = []
  end
  
  def contests
    @contests
  end
  
  def run
    # Round robin contests
    while (@players.size >= 2) do
      player = @players.shift
      @players.each do |opponent|
        contest = Contest.new(player, opponent, 10)
        contest.play
        @contests.push contest
      end
    end
  end
end