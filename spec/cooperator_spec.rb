require 'cooperator'

describe Cooperator do
  before(:each) do
    @player = Cooperator.new
  end
  context 'in the first instance' do
    it 'should cooperate' do
      @player.choice.should eql :cooperate
    end
  end
  context 'when confronted with defection' do
    it 'should cooperate' do
      @player.experience :defect
      @player.choice.should eql :cooperate
    end
  end
  context 'when presented with cooperation' do
    it 'should cooperate' do
      @player.experience :cooperate
      @player.choice.should eql :cooperate
    end
  end
end