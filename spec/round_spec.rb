require 'round'
require_relative '../players/defector'
require_relative '../players/tit_for_tat'

describe Round do
  context 'with two players' do
    context 'and game outcomes registered in arbitrary sequence' do
      it 'should return league table of two, in descending order of score' do
        player_one = Defector.new
        player_two = TitForTat.new
        round = Round.new [player_one, player_two]
      
        round.award_points(player_one, 10)
        round.award_points(player_two, 30)
        
        results = round.results

        results.size.should == 2
        total = results.first.total
        results.each do |result|
          result.total.should be <= total
        end
      end
    end
  end
end