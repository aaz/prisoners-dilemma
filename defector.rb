class Defector
  def initialize
    @decision = :defection
  end
  
  def decision
    return @decision
  end
  
  def experience(counterparty_decision)
  end
end