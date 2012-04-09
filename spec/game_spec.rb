require 'game'
require 'tit4tat'

describe Game do
  it 'should alternate calls to players, calling each the same number of times' do
    players = mock("players")   # One mock for both players, to check strict call ordering
    iterations = 10
    iterations.times do
      2.times {players.should_receive(:choice).ordered}
      2.times {players.should_receive(:experience).ordered}
    end
    game = Game.new(players, players, iterations)
    game.play
  end
  context 'of 10 iterations between paired Tit For Tat players' do
    it 'should result in 30 points each' do
      player_one = Tit4Tat.new
      player_two = Tit4Tat.new
      game = Game.new(player_one, player_two, 10)
      game.play
      game.scores[player_one].should == 30
      game.scores[player_two].should == 30
    end
  end
end
 