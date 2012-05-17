require 'player'

class Friedman
  include Player
  
  def choice
    if @memory_of_other_player.member? :defect
      return :defect
    else
      return :cooperate
    end
  end
end