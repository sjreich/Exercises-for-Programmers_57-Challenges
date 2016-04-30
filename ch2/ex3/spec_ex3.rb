require_relative 'ex3'

describe 'StringLengthCounter' do
  describe '#count' do
    it 'returns the length of a string' do
      s = StringLengthCounter.new
      expect( s.count("banana") ).to eq 6
    end
  end
end