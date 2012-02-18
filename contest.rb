class Contest
  def initialize(player_one, player_two, number_of_rounds)
    @player_one = player_one
    @player_one_score = 0
    @player_two = player_two
    @player_two_score = 0
    @number_of_rounds = number_of_rounds
  end
  
  def play
      @number_of_rounds.times do
      player_one_decision = @player_one.decision
      player_two_decision = @player_two.decision
      score_round(player_one_decision, player_two_decision)
      @player_one.experience player_two_decision
      @player_two.experience player_one_decision
    end
  end
  
  def score_round(player_one_decision, player_two_decision)
    if player_one_decision == :cooperation and player_two_decision == :cooperation
      @player_one_score += 3
      @player_two_score += 3
    elsif player_one_decision == :cooperation and player_two_decision == :defection
      @player_one_score += 0
      @player_two_score += 5
    elsif player_one_decision == :defection and player_two_decision == :cooperation
      @player_one_score += 5
      @player_two_score += 0
    elsif player_one_decision == :defection and player_two_decision == :defection
      @player_one_score += 1
      @player_two_score += 1
    end
  end
  
  def player_one_score
    @player_one_score
  end
  
  def player_two_score
    @player_two_score
  end
end