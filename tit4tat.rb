require 'player'

class Tit4Tat
  include Player
  
  def initialize(name=nil)
    super(name)
  end
  
  def choice
    if @memory_of_other_player.empty? then
      return :cooperate
    else
      return @memory_of_other_player.last
    end
  end
end