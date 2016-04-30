# how to write the test

class Greeter
  def run!
    name = get_name
    puts greet(name)
  end

  def greet(name)
    select_greeting.gsub('<name>', name)
  end

  private
  GREETINGS = [ "Hi, <name>!",
                "Hi diddly-ho, <name>!",
                "So, <name>... We meet again.",
                "What's new, <name>?"
              ]

  def select_greeting
    GREETINGS.sample
  end

  def get_name
    print "Enter your name: "
    gets.chomp
  end
end

# Greeter.new.run!