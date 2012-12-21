require 'tournament'
require_relative '../players/tit_for_tat'
require_relative '../players/defector'

describe Tournament do
  context 'with 5 players' do
    it 'should involve 15 games' do
      players = []
      5.times {players.push(TitForTat.new)}
      tournament = Tournament.new(players)
      tournament.run
      tournament.games.size.should == 15
    end
  end
  context 'with one Defector and one Tit For Tat player' do
    it 'should involve a gane between each player and its twin' do
      defector = Defector.new
      tit_for_tat = TitForTat.new
      tournament = Tournament.new([defector, tit_for_tat])
      tournament.run
      tournament.games.should have_key([defector.name, defector.name])
      tournament.games.should have_key([tit_for_tat.name, tit_for_tat.name])
    end
  end
end