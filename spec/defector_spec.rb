require_relative '../players/defector'

describe 'Defector' do
  context 'in the first instance' do
    it 'should defect' do
      player = Defector.new
      player.choice.should eql :defect
    end
  end
  context 'when confronted with defection' do
    it 'should defect' do
      player = Defector.new
      player.experience :defect
      player.choice.should eql :defect
    end
  end
  context 'when presented with cooperation' do
    it 'should defect' do
      player = Defector.new
      player.experience :cooperate
      player.choice.should eql :defect
    end
  end
end