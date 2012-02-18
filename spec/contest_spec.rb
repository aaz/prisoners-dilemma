require_relative '../contest'
require_relative '../tit4tat'

describe "Contest" do
  context "of ten rounds between a pair of tit-for-tat players" do
    before(:each) do
      @contest = Contest.new(Tit4Tat.new, Tit4Tat.new, 10)
    end
    it "should end in a draw" do
      @contest.play
      @contest.player_one_score.should eql @contest.player_two_score
    end
    it "should result in 10 * 3 points each" do
      @contest.play
      @contest.player_one_score.should eql 30
      @contest.player_two_score.should eql 30
    end
  end
end
 