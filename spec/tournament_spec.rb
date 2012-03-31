require 'tournament'
require 'tit4tat'
require 'defector'

describe Tournament do
  context 'with 5 tit4tat players' do
    before(:each) do
      @players = []
      5.times {@players.push(Tit4Tat.new)}
      @tournament = Tournament.new(@players)
      @tournament.run
    end
    it 'should involve 15 contests' do
      @tournament.contests.size.should == 15
    end
    it 'should result in 30 points per player' do
      @tournament.contests.keys.each do |key|
        @tournament.contests[key].player_one_score.should == 30
        @tournament.contests[key].player_two_score.should == 30
      end
    end
  end
  it 'should involve a contest between each strategy and its twin' do
    # pending
    defector = Defector.new
    tit4tat = Tit4Tat.new
    players = [defector, tit4tat]
    tournament = Tournament.new(players)
    tournament.run
    tournament.contests.should have_key([defector.name, defector.name])
    tournament.contests.should have_key([tit4tat.name, tit4tat.name])
  end
end