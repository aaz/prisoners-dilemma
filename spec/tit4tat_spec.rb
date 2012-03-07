require_relative '../tit4tat'

describe "Tit4Tat player" do
  before(:each) do
    @player = Tit4Tat.new
  end
  context "in the first instance" do
    it "should cooperate" do
      @player.choice.should eql :cooperate
    end
  end
  context "when confronted with defection" do
    it "should retaliate" do
      @player.experience :defect
      @player.choice.should eql :defect
    end
  end
  context "when presented with cooperation" do
    it "should reciprocate" do
      @player.experience :cooperate
      @player.choice.should eql :cooperate
    end
  end
  context "when repeatedly confronted with defection" do
    context "yet then presented with cooperation" do
      it "should forgive" do
        20.times {@player.experience :defect}
        @player.experience :cooperate
        @player.choice.should eql :cooperate
      end
    end
  end
  context "when repeatedly presented with cooperation" do
    context "yet then confronted with defection" do
      it "should punish" do
        20.times {@player.experience :cooperate}
        @player.experience :defect
        @player.choice.should eql :defect
      end
    end
  end
end