require 'spec_helper'
require 'organiser'

describe Organiser do
  yaml = <<-END
---
-
  class: Defector
  name: Traitor
-
  class: Tit4Tat
-
  class: RandomPlayer
END

  context "reading config file contents:\n#{yaml}" do
    before(:each) do
      @organiser = Organiser.new
      @organiser.read_config(yaml)
    end
    it 'should set up a tournament with 3 players' do
      @organiser.tournament.players.size.should == 3
    end
    it 'should include a Defector called Traitor' do
      @organiser.tournament.players.should contain("Traitor")
    end
    it 'should include a Tit4Tat player' do
      @organiser.tournament.players.should contain_anonymous("Tit4Tat")
    end
    it 'should include a RandomPlayer' do
      @organiser.tournament.players.should contain_anonymous("RandomPlayer")
    end
  end
end