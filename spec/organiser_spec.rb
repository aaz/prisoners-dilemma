require 'spec_helper'
require 'organiser'

describe Organiser do
  yaml = <<-END
---
-
  iterations: 20
-
  class: Defector
  name: Traitor
-
  class: TitForTat
  copies: 3
-
  class: RandomPlayer
END

  context "reading config file contents:\n#{yaml}" do
    before(:each) do
      organiser = Organiser.new
      @round = organiser.read_config(yaml).round
    end
    it 'should set up a tournament with 5 players' do
      @round.players.size.should == 5
    end
    it 'should include a Defector called Traitor' do
      @round.players.should contain("Traitor")
    end
    it 'should include a TitForTat player' do
      @round.players.should contain_anonymous("TitForTat")
    end
    it 'should include a RandomPlayer' do
      @round.players.should contain_anonymous("RandomPlayer")
    end
    it 'should involve games of 20 iterations' do
      @round.iterations.should == 20
    end
  end
end