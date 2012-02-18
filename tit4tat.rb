class Tit4Tat
  def initialize
    @decision = :cooperation
  end
  
  def decision
    return @decision
  end
  
  def experience(counter_party_decision)
    @decision = counter_party_decision
  end
end