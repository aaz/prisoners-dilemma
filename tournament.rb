require 'contest'

class Tournament
  attr_reader :round, :contests
  def initialize(players)
    @players = players
    @round = Round.new(players)
    @contests = {}
  end
  
  def run
    # Round robin contests
    for i in 0..(@players.size-1) do
      player = @players[i]
      for j in (i+1)..(@players.size-1) do
        opponent = @players[j]
        contest = Contest.new(player, opponent, 10)
        contest.play
        @round.award_points(player, contest.scores[player])
        @round.award_points(opponent, contest.scores[opponent])
        @contests[[player.name, opponent.name]] = contest
      end
      twin = player.dup
      contest = Contest.new(player, twin, 10)
      contest.play
      @round.award_points(player, contest.scores[player])
      @contests[[player.name, twin.name]] = contest
    end
  end
end