class StringLengthCounter
  def run!
    print "Enter a string: "
    input = gets.chomp
    output = count(input)
    puts "Your string has #{output} characters."
  end

  def count(string)
    string.length
  end

  def remove_white_space(string)
    string.gsub(/\W/, "")
  end
end

StringLengthCounter.new.run!