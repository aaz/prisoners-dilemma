require 'tournament'
require 'tit4tat'
require 'defector'

describe Tournament do
  context 'with 5 players' do
    it 'should involve 15 contests' do
      players = []
      5.times {players.push(Tit4Tat.new)}
      tournament = Tournament.new(players)
      tournament.run
      tournament.contests.size.should == 15
    end
  end
  it 'should involve a contest between each strategy and its twin' do
    defector = Defector.new
    tit4tat = Tit4Tat.new
    players = [defector, tit4tat]
    tournament = Tournament.new(players)
    tournament.run
    tournament.contests.should have_key([defector.name, defector.name])
    tournament.contests.should have_key([tit4tat.name, tit4tat.name])
  end
end