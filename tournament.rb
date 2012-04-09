require 'contest'

class Tournament
  attr_reader :contests, :players, :iterations
  def initialize(players, iterations=100)
    @players = players
    @iterations = iterations
    @round = Round.new(players)
    @contests = {}
  end
  
  def run
    # Round robin contests
    for i in 0..(@players.size-1) do
      player = @players[i]
      for j in (i+1)..(@players.size-1) do
        opponent = @players[j]
        contest = Game.new(player, opponent, @iterations)
        contest.play
        @round.award_points(player, contest.scores[player])
        @round.award_points(opponent, contest.scores[opponent])
        @contests[[player.name, opponent.name]] = contest
      end
      twin = player.dup
      contest = Game.new(player, twin, 10)
      contest.play
      @round.award_points(player, contest.scores[player])
      @contests[[player.name, twin.name]] = contest
    end
  end
  
  def results
    @round.results
  end
end