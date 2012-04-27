require 'player'

class Cooperator
  include Player

  def choice
    :cooperate
  end
end