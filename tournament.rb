require_relative 'contest'

class Tournament
  def initialize(players)
    @players = players
    @contests = {}
  end
  
  def contests
    @contests
  end
  
  def run
    # Round robin contests
#    for i in 0..(@players.size-2) do
#      for j in (i+1)..(@players.size-1) do
#        @contests[[@players[i], @players[j]]] = Contest.new(@players[i], @players[j], 10)
#        @contests[[@players[i], @players[j]]].play
#      end
#    end
    
    while (@players.size >= 2) do
      player = @players.shift
      @players.each do |opponent|
        contest = Contest.new(player, opponent, 10)
        contest.play
        @contests[[player.name, opponent.name]] = contest
      end
    end
  end
end