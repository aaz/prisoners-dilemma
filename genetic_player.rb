class GeneticPlayer
  def initialize(code)
    if code.length != 15
      raise ArgumentError.new("Genetic code length is not 15")
    end
    code.each_char do |char|
      if char != 'C' and char != 'D' then
        raise ArgumentError.new("Genetic code contains something other than 'C' or 'D'")
      end
    end
  end
end