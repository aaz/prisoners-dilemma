require 'player'

class Tit4Tat
  include Player
  
  def initialize(name=nil)
    name == nil ? super() : super(name)
  end
  
  def choice
    if @memory_of_other_player.empty? then
      return :cooperate
    else
      return @memory_of_other_player.last
    end
  end
end