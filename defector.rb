require 'player'

class Defector
  include Player

  def initialize(name=nil)
    super(name)
  end
  
  def choice
    return :defect
  end
end