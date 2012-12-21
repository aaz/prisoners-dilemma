require 'player'

class RandomPlayer
  include Player
  
  def initialize(name=nil)
    super(name)
    @random_generator = Random.new
  end
  
  def choice
    @random_generator.rand(2) == 0? :defect : :cooperate
  end
end