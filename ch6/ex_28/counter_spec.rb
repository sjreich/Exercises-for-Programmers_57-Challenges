require_relative 'counter.rb'

describe Counter do
  let(:counter) { Counter.new }

  describe '#echo' do
    it 'outputs the input' do
      allow(STDIN).to receive(:gets) { 'hotdog' }
      expect(counter.echo).to eq 'hotdog'
      # input = StringIO.new("one\ntwo\nthree\n")
      # expect { counter.echo }.to output("one").to_stdout
    end
  end

      #   date = Birthday.new
      # date.stub(:gets) {Date.today.strftime("%m/%d")}

  # describe '#get_one_input' do
  #   it 'should stop on "x"' do
  #     $stdin = StringIO.new('x')
  #     counter.get_one_input
  #     expect($stdin.string).to match(/x/)  
  #   end

    # it 'should accept integers' do
    #   input = StringIO.new("1\n")
    #   input.gets
    # end

    # it 'should reject non-integers' do
    #   input = StringIO.new("hotdog\n")

    # end
  # end

  # describe '#sum_of_inputs' do
  #   it 'should add the numbers in an array' do
  #     expect( counter.sum_of_inputs( [] )).to        eq( 0 )
  #     expect( counter.sum_of_inputs( [1, 2, 3] )).to eq( 6 )
  #     expect( counter.sum_of_inputs( [-1, 1] )).to   eq( 0 )
  #   end
  # end

end