require 'player'

class Defector
  include Player

  def initialize(name=nil)
    name == nil ? super() : super(name)
  end
  
  def choice
    return :defect
  end
end