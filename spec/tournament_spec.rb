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
    it 'should involve 10 contests' do
      @tournament.contests.size.should == 10
    end
    it 'should result in 30 points per player' do
      @tournament.contests.keys.each do |key|
        @tournament.contests[key].player_one_score.should == 30
        @tournament.contests[key].player_two_score.should == 30
      end
    end
  end
  context 'with three players' do
    it 'should have a result for the contest between a strategy and its twin' do
      pending
      defector = Defector.new
      tit4tat = Tit4Tat.new
      players = [defector, tit4tat]
      tournament = Tournament.new(players)
      tournament.run
      tournament.contests.should have_key([defector.name, defector.name])
    end
  end
end