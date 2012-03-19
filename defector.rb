require 'player'

class Defector
  include Player

  def initialize
    super()
  end
  
  def choice
    return :defect
  end
end