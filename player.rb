module Player
  def initialize(name=(self.class.to_s + '.' + self.object_id.to_s))
    @player_name = name
    @memory_of_other_player = []
  end
  
  def name
    @player_name
  end
  
  def experience(other_players_last_choice)
    @memory_of_other_player.push other_players_last_choice 
  end
end