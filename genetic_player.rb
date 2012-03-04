class GeneticPlayer
  def initialize(code)
    if code.length != 11
      raise ArgumentError.new("Genetic code length is not 11")
    end
    code.each_char do |char|
      if char != 'C' and char != 'D' then
        raise ArgumentError.new("Genetic code contains something other than 'C' or 'D'")
      end
    end
    @code = code
    @history = []
    # First three letters encode initial conditions
    @code[0..2].each_char do |char|
      if char == 'C' then
        @history.push :cooperation
      else
        @history.push :defection
      end
    end
  end
  
  def decision
    case @history.last 3
    when [:cooperation, :cooperation, :cooperation]
      letter = @code[3]
    when [:cooperation, :cooperation, :defection]
      letter = @code[4]
    when [:cooperation, :defection, :cooperation]
      letter = @code[5]
    when [:cooperation, :defection, :defection]
      letter = @code[6]
    when [:defection, :cooperation, :cooperation]
      letter = @code[7]
    when [:defection, :cooperation, :defection]
      letter = @code[8]
    when [:defection, :defection, :cooperation]
      letter = @code[9]
    when [:defection, :defection, :defection]
      letter = @code[10]
    end
    return letter == 'C' ? :cooperation : :defection
  end
  
  def experience(counterparty_decision)
    @history.push counterparty_decision
  end
end