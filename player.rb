module Player
  def initialize(name=nil)
    @player_name = name == nil ? (self.class.to_s + '.' + self.object_id.to_s) : name
    @memory_of_other_player = []
  end
  
  def initialize_copy(name=@player_name)
    @memory_of_other_player = []
  end
  
  def name
    @player_name
  end
  
  def experience(other_players_last_choice)
    @memory_of_other_player.push other_players_last_choice 
  end
end