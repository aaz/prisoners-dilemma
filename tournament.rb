require 'contest'

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
    for i in 0..(@players.size-1) do
      player = @players[i]
      for j in (i+1)..(@players.size-1) do
        opponent = @players[j]
        @contests[[player.name, opponent.name]] = Contest.new(player, opponent, 10)
        @contests[[player.name, opponent.name]].play
      end
      twin = player.dup
      @contests[[player.name, twin.name]] = Contest.new(player, twin, 10)
      @contests[[player.name, twin.name]].play
    end
  end
end