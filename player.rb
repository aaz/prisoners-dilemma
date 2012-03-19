module Player
  def initialize
    @memory_of_other_player = []
  end
  
  def experience(other_players_last_choice)
    @memory_of_other_player.push other_players_last_choice 
  end
end