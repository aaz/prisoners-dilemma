require 'tit_for_two_tats'

describe 'TitForTwoTats' do
  before(:each) do
    @player = TitForTwoTats.new
  end
  context 'in the first instance' do
    it 'should cooperate'
  end
  context 'when confronted with an isolated defection' do
    it 'should continue to cooperate'
  end
  context 'when confronted with two consecutive defections' do
    it 'should retaliate'
  end
end