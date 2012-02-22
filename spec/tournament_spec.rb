require_relative '../tournament'
require_relative '../tit4tat'

describe Tournament do
  context 'with 5 tit4tat players' do
    before(:each) do
      @players = []
      5.times {@players.push(Tit4Tat.new)}
      @tournament = Tournament.new(@players)
      @tournament.run
    end
    it 'should involve 10 contests' do
      @tournament.contests.size.should == 10
    end
    it 'should result in 30 points per player' do
      @tournament.contests.each do |contest|
        contest.player_one_score.should == 30
        contest.player_two_score.should == 30
      end
    end
  end
end