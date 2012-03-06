require_relative '../genetic_player'

describe GeneticPlayer do
  MUTANT_CODE = 'C' * 30 + 'F' + 'D' * 39
  it "should be created with genetic code containing only Cs and Ds" do
    expect {
      GeneticPlayer.new(MUTANT_CODE)
    }.to raise_error(ArgumentError)
  end
  it "should have a genetic code of precisely 70 characters" do
    expect {
      GeneticPlayer.new('')
    }.to raise_error(ArgumentError)
    expect {
      GeneticPlayer.new('CDCDCDCDCD')
    }.to raise_error(ArgumentError)
  end
  # Encoded strategy: unconditionally cooperate
  UNCONDITIONAL_COOPERATION = 'CCCCCC' + 'CCCCCCCC' * 8
  context "with genetic code #{UNCONDITIONAL_COOPERATION}" do
    before(:each) do
      @player = GeneticPlayer.new(UNCONDITIONAL_COOPERATION)
    end
    it "should cooperate initially" do
      @player.decision.should eql :cooperation
    end
    context "when confronted with three consecutive defections" do
      it "should still cooperate" do
        3.times do
          @player.decision
          @player.experience :defection
        end
        @player.decision.should eql :cooperation
      end
    end
    context "when presented with three consecutive cooperations" do
      it "should reciprocate" do
        3.times do
          @player.decision
          @player.experience :cooperation
        end
        @player.decision.should eql :cooperation
      end
    end
  end
  # Encoded strategy: defect when opponent defects at least twice in last three
  # Assumes cooperation-cooperation-cooperation as initial condition
  PUNISH_2_DEFECTIONS_BEGINS_CCCCCC = 'CCCCCC' + 'CCCDCDDD' * 8
  context "with genetic code #{PUNISH_2_DEFECTIONS_BEGINS_CCCCCC}" do
    before(:each) do
      @player = GeneticPlayer.new(PUNISH_2_DEFECTIONS_BEGINS_CCCCCC)
    end
    it "should cooperate initially" do
      @player.decision.should eql :cooperation
    end
    context "when exposed to defection, cooperation, defection" do
      it "should defect" do
        @player.decision
        @player.experience :defection
        @player.decision
        @player.experience :cooperation
        @player.decision
        @player.experience :defection
        @player.decision.should eql :defection
      end
    end
  end
  # Encoded strategy: defect when opponent defects at least twice in last three
  # Assumes defection-cooperation-defection as initial condition
  PUNISH_2_DEFECTIONS_BEGINS_CDCCCD = 'CDCCCD' + 'CCCDCDDD' * 8
  context "with genetic code #{PUNISH_2_DEFECTIONS_BEGINS_CDCCCD}" do
    it "should defect initially" do
      player = GeneticPlayer.new(PUNISH_2_DEFECTIONS_BEGINS_CDCCCD)
      player.decision.should eql :defection
    end
  end
end