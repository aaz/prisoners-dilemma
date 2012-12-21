require 'player'

class Defector
  include Player

  def choice
    return :defect
  end
end