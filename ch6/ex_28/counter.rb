class Counter
  
  def initialize
    @numbers = []
    gather_inputs
    puts "The number(s) sum to #{sum_of_inputs}."
  end

  def sum_of_inputs
    @numbers.inject(0, :+)
  end

  private
    # or is it better to have this method returning the inputs?
    def gather_inputs
      @stop_sign_received = false
      while !@stop_sign_received
        get_one_input
      end
    end

    def get_one_input
      print "Enter an integer (or 'stop' to stop): "
      input = gets.chomp.downcase
      if input == 'stop'
        @stop_sign_received = true
      elsif /\A-?\d+\z/ === input
        @numbers << input.to_i
      else
        print "That wasn't an integer. "
      end
    end

end

Counter.new



