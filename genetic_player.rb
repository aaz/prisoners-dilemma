class GeneticPlayer
  PERMS = [
    [:cooperate, :cooperate, :cooperate],
    [:cooperate, :cooperate, :defect],
    [:cooperate, :defect, :cooperate],
    [:cooperate, :defect, :defect],
    [:defect, :cooperate, :cooperate],
    [:defect, :cooperate, :defect],
    [:defect, :defect, :cooperate],
    [:defect, :defect, :defect]
  ]
  OFFSET = 6
  
  @@index = {}
  # Create lookup table
  for i in 0..(PERMS.length - 1)
    for j in 0..(PERMS.length - 1)
      @@index[[PERMS[i], PERMS[j]]] = (i*8) + j
    end
  end
  
  def interpret_char(char)
    if char != 'C' and char != 'D' then
      raise ArgumentError.new("Genetic code contains something other than 'C' or 'D'")
    end
    char == 'C' ? :cooperate : :defect
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
    @accomplices_choices = []
    # First six letters encode initial conditions: 3 iterations,
    #   alternating as my choice; accomplice's choice ...
    for i in 0..(OFFSET-1)
      choice = interpret_char(@code[i])
      if i%2 == 0
        @my_choices.push choice
      else
        @accomplices_choices.push choice
      end
    end
  end
  
  def choice
    last_three_iterations = [(@my_choices.last 3), (@accomplices_choices.last 3)]
    index = @@index[last_three_iterations] + OFFSET
    char = @code[index]
    
    choice = interpret_char(char)
    @my_choices.push choice
    return choice
  end
  
  def experience(counterparty_choice)
    @accomplices_choices.push counterparty_choice
  end
end