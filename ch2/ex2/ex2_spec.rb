require_relative 'ex2'

describe 'Greeter' do
  g = Greeter.new
  complete_greetings =  [ "Hi, Dave!", 
                          "Hi diddly-ho, Dave!",
                          "So, Dave... We meet again.",
                          "What's new, Dave?"
                        ]
  it 'greets by name' do
    10.times do
      expect( complete_greetings ).to include g.greet("Dave")
    end
  end
end