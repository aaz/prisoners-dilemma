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
      player_one_choice = @player_one.choice
      player_two_choice = @player_two.choice
      score_round(player_one_choice, player_two_choice)
      @player_one.experience player_two_choice
      @player_two.experience player_one_choice
    end
  end
  
  def score_round(player_one_choice, player_two_choice)
    if player_one_choice == :cooperate and player_two_choice == :cooperate
      @player_one_score += 3
      @player_two_score += 3
    elsif player_one_choice == :cooperate and player_two_choice == :defect
      @player_one_score += 0
      @player_two_score += 5
    elsif player_one_choice == :defect and player_two_choice == :cooperate
      @player_one_score += 5
      @player_two_score += 0
    elsif player_one_choice == :defect and player_two_choice == :defect
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