require 'game'

class Round
  attr_reader :games, :players, :iterations
  
  def initialize(players, iterations=100)
    @players = players
    @iterations = iterations
    @games = {}
    @players_scores = {}
    players.each {|player| @players_scores[player] = 0}
    @results = []
  end
  
  def run
    # Round robin games
    for i in 0..(@players.size-1) do
      player = @players[i]
      for j in (i+1)..(@players.size-1) do
        opponent = @players[j]
        game = Game.new(player, opponent, @iterations)
        game.play
        award_points(player, game.scores[player])
        award_points(opponent, game.scores[opponent])
        @games[[player.name, opponent.name]] = game
      end
      twin = player.dup
      game = Game.new(player, twin, 10)
      game.play
      award_points(player, game.scores[player])
      @games[[player.name, twin.name]] = game
    end
  end
  
  def award_points(player, score)
    @players_scores[player] += score
  end
  
  def results
    if @results.empty? then
      @players_scores.each do |player, score|
        @results.push Result.new(player, score)
      end
    end
    return @results.sort
  end
end

class Result
  attr_reader :player, :total
  def initialize(player, total)
    @player = player
    @total = total
  end
  
  def to_s
    "#{@player.name}, #{@total.to_s}"
  end
  
  def <=>(result)
    result.total <=> @total
  end
end