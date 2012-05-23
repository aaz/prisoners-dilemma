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
  class: Tit4Tat
  copies: 3
-
  class: RandomPlayer
END

  context "reading config file contents:\n#{yaml}" do
    before(:each) do
      organiser = Organiser.new
      @tournament = organiser.read_config(yaml)
    end
    it 'should set up a tournament with 5 players' do
      @tournament.players.size.should == 5
    end
    it 'should include a Defector called Traitor' do
      @tournament.players.should contain("Traitor")
    end
    it 'should include a Tit4Tat player' do
      @tournament.players.should contain_anonymous("Tit4Tat")
    end
    it 'should include a RandomPlayer' do
      @tournament.players.should contain_anonymous("RandomPlayer")
    end
    it 'should involve games of 20 iterations' do
      @tournament.iterations.should == 20
    end
  end
end