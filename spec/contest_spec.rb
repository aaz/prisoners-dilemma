require_relative '../contest'

describe Contest do
  it 'should alternate calls to players, calling each the same number of times' do
    players = mock("players")   # One mock for both players, to check strict call ordering
    iterations = 10
    iterations.times do
      2.times {players.should_receive(:choice).ordered}
      2.times {players.should_receive(:experience).ordered}
    end
    contest = Contest.new(players, players, iterations)
    contest.play
  end
end
 