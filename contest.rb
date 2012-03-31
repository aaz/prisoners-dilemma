class Contest
  def initialize(player_one, player_two, number_of_rounds)
    @player_one = player_one
    @player_two = player_two
    @number_of_rounds = number_of_rounds
    @scores = {}
    @scores[@player_one] = 0
    @scores[@player_two] = 0
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
      @scores[@player_one] += 3
      @scores[@player_two] += 3
    elsif player_one_choice == :cooperate and player_two_choice == :defect
      @scores[@player_one] += 0
      @scores[@player_two] += 5
    elsif player_one_choice == :defect and player_two_choice == :cooperate
      @scores[@player_one] += 5
      @scores[@player_two] += 0
    elsif player_one_choice == :defect and player_two_choice == :defect
      @scores[@player_one] += 1
      @scores[@player_two] += 1
    end
  end
  
  def scores
    @scores
  end
end