require_relative '../genetic_player'

describe GeneticPlayer do
  it "should be created with genetic code containing only Cs and Ds" do
    expect {
      GeneticPlayer.new('CCCCDDDDDCCCF')
    }.to raise_error(ArgumentError)
  end
  it "should have a genetic code of precisely 15 characters" do
    expect {
      GeneticPlayer.new('')
    }.to raise_error(ArgumentError)
    expect {
      GeneticPlayer.new('CDCDCDCDCDCDCDCD')
    }.to raise_error(ArgumentError)
  end
end