require_relative '../players/friedman'

describe 'Friedman' do
  before(:each) do
    @player = Friedman.new
  end
  context 'in the first instance' do
    it 'should cooperate' do
      @player.choice.should eql :cooperate
    end
  end
  context 'when confronted with defection' do
    it 'should defect' do
      @player.experience :defect
      @player.choice.should eql :defect
    end
  end
  context 'having experienced defection' do
    it 'should never forgive' do
      @player.experience :defect
      3.times {@player.experience :cooperate}
      @player.choice.should eql :defect
    end
  end
end