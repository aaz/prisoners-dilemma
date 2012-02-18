require_relative '../defector'

describe 'Defector' do
  context 'in the first instance' do
    it 'should defect' do
      player = Defector.new
      player.decision.should eql :defection
    end
  end
  context 'when confronted with defection' do
    it 'should defect' do
      player = Defector.new
      player.experience :defection
      player.decision.should eql :defection
    end
  end
  context 'when presented with cooperation' do
    it 'should defect' do
      player = Defector.new
      player.experience :cooperation
      player.decision.should eql :defection
    end
  end
end