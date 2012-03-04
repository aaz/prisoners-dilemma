require_relative '../genetic_player'

describe GeneticPlayer do
  it "should be created with genetic code containing only Cs and Ds" do
    expect {
      GeneticPlayer.new('CCCDFDCCCDD')
    }.to raise_error(ArgumentError)
  end
  it "should have a genetic code of precisely 11 characters" do
    expect {
      GeneticPlayer.new('')
    }.to raise_error(ArgumentError)
    expect {
      GeneticPlayer.new('CDCDCDCDCD')
    }.to raise_error(ArgumentError)
  end
  # Encoded strategy: unconditionally cooperate
  context "with genetic code 'CCCCCCCCCCC'" do
    before(:each) do
      @player = GeneticPlayer.new('CCCCCCCCCCC')
    end
    it "should cooperate initially" do
      @player.decision.should eql :cooperation
    end
    context "when confronted with three consecutive defections" do
      it "should still cooperate" do
        3.times{@player.experience :defection}
        @player.decision.should eql :cooperation
      end
    end
    context "when presented with three consecutive cooperations" do
      it "should reciprocate" do
        3.times{@player.experience :cooperation}
        @player.decision.should eql :cooperation
      end
    end
  end
  # Encoded strategy: defect when opponent defects at least twice in last three
  # Assumes cooperation-cooperation-cooperation as initial condition
  context "with genetic code 'CCCCCCDCDDD'" do
    before(:each) do
      @player = GeneticPlayer.new('CCCCCCDCDDD')
    end
    it "should cooperate initially" do
      @player.decision.should eql :cooperation
    end
    context "when exposed to defection, cooperation, defection" do
      it "should defect" do
        @player.experience :defection
        @player.experience :cooperation
        @player.experience :defection
        @player.decision.should eql :defection
      end
    end
  end
  # Encoded strategy: defect when opponent defects at least twice in last three
  # Assumes defection-cooperation-defection as initial condition
  context "with genetic code 'DDCCCCDCDDD'" do
    it "should defect initially" do
      player = GeneticPlayer.new('DDCCCCDCDDD')
      player.decision.should eql :defection
    end
  end
end