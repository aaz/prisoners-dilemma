require 'round'
require_relative '../players/defector'
require_relative '../players/tit_for_tat'

describe Round do
  context 'with five players' do
    it 'should involve fifteen games' do
      players = []
      5.times {players.push(TitForTat.new)}
      round = Round.new(players)
      round.run
      round.games.size.should == 15
    end
  end
  context 'with one Defector and one Tit For Tat player' do
    it 'should involve a game between each player and its twin' do
      defector = Defector.new
      tit_for_tat = TitForTat.new
      round = Round.new([defector, tit_for_tat])
      round.run
      round.games.should have_key([defector.name, defector.name])
      round.games.should have_key([tit_for_tat.name, tit_for_tat.name])
    end
  end
end