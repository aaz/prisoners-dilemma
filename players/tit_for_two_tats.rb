require 'player'

class TitForTwoTats
  include Player

  def choice
    if @memory_of_other_player.size > 1 and 
        @memory_of_other_player.last(2) == [:defect, :defect] then
      return :defect
    else
      return :cooperate
    end
  end
end