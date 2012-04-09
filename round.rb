class Round
  def initialize(players)
    @players_scores = {}
    players.each {|player| @players_scores[player] = 0}
    @results = []
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