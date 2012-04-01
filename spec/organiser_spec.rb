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
    it 'should include a Defector called Traitor'
    it 'should include a nameless Tit4Tat player'
    it 'should include a nameless RandomPlayer'
  end
end