class GeneticPlayer
  PERMS = [
    [:cooperation, :cooperation, :cooperation],
    [:cooperation, :cooperation, :defection],
    [:cooperation, :defection, :cooperation],
    [:cooperation, :defection, :defection],
    [:defection, :cooperation, :cooperation],
    [:defection, :cooperation, :defection],
    [:defection, :defection, :cooperation],
    [:defection, :defection, :defection]
  ]
  OFFSET = 6
  
  @@index = {}
  # Create lookup table
  for i in 0..(PERMS.length - 1)
    for j in 0..(PERMS.length - 1)
      @@index[[PERMS[i], PERMS[j]]] = (i*8) + j
    end
  end
  
  def ind
    return @@index
  end
  
  def initialize(code)
    if code.length != 70
      raise ArgumentError.new("Genetic code length is not 70")
    end
    code.each_char do |char|
      if char != 'C' and char != 'D' then
        raise ArgumentError.new("Genetic code contains something other than 'C' or 'D'")
      end
    end
    @code = code
    @my_choices = []
    @opponents_choices = []
    # First six letters encode initial conditions
    for i in 0..5
      choice = @code[i] == 'C' ? :cooperation : :defection
      if i%2 == 0
        @my_choices.push choice
      else
        @opponents_choices.push choice
      end
    end
  end
  
  def decision
    last_three_iterations = [(@my_choices.last 3), (@opponents_choices.last 3)]
    index = @@index[last_three_iterations] + OFFSET
    letter = @code[index]
    
    choice = letter == 'C' ? :cooperation : :defection
    @my_choices.push choice
    return choice
  end
  
  def experience(counterparty_decision)
    @opponents_choices.push counterparty_decision
  end
end