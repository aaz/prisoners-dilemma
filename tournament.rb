require 'game'
require 'round'

class Tournament
  attr_reader :games, :players, :iterations
  def initialize(players, iterations=100)
    @players = players
    @iterations = iterations
    @round = Round.new(players)
    @games = {}
  end
  
  def run
    # Round robin games
    for i in 0..(@players.size-1) do
      player = @players[i]
      for j in (i+1)..(@players.size-1) do
        opponent = @players[j]
        game = Game.new(player, opponent, @iterations)
        game.play
        @round.award_points(player, game.scores[player])
        @round.award_points(opponent, game.scores[opponent])
        @games[[player.name, opponent.name]] = game
      end
      twin = player.dup
      game = Game.new(player, twin, 10)
      game.play
      @round.award_points(player, game.scores[player])
      @games[[player.name, twin.name]] = game
    end
  end
  
  def results
    @round.results
  end
end