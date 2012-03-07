class Tit4Tat
  def initialize
    @choice = :cooperate
  end
  
  def choice
    return @choice
  end
  
  def experience(counterparty_choice)
    @choice = counterparty_choice
  end
end