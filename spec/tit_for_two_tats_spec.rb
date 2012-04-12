require 'tit_for_two_tats'

describe 'TitForTwoTats' do
  before(:each) do
    @player = TitForTwoTats.new
  end
  context 'in the first instance' do
    it 'should cooperate' do
      @player.choice.should eql :cooperate
    end
  end
  context 'when confronted with an isolated defection' do
    it 'should continue to cooperate' do
      @player.experience :cooperate
      @player.experience :defect
      @player.choice.should eql :cooperate
      @player.experience :cooperate
      @player.choice.should eql :cooperate
    end
  end
  context 'when confronted with two consecutive defections' do
    it 'should retaliate' do
      @player.experience :cooperate
      @player.experience :defect
      @player.choice.should eql :cooperate
      @player.experience :defect
      @player.choice.should eql :defect
    end
  end
end