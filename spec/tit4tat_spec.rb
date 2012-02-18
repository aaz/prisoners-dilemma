require_relative '../tit4tat'

describe "Tit4Tat player" do
  before(:each) do
    @player = Tit4Tat.new
  end
  context "in the first instance" do
    it "should cooperate" do
      @player.decision.should eql :cooperation
    end
  end
  context "when confronted with defection" do
    it "should retaliate" do
      @player.experience :defection
      @player.decision.should eql :defection
    end
  end
  context "when presented with cooperation" do
    it "should reciprocate" do
      @player.experience :cooperation
      @player.decision.should eql :cooperation
    end
  end
  context "when repeatedly confronted with defection" do
    context "yet then presented with cooperation" do
      it "should forgive" do
        20.times {@player.experience :defection}
        @player.experience :cooperation
        @player.decision.should eql :cooperation
      end
    end
  end
  context "when repeatedly presented with cooperation" do
    context "yet then confronted with defection" do
      it "should punish" do
        20.times {@player.experience :cooperation}
        @player.experience :defection
        @player.decision.should eql :defection
      end
    end
  end
end