require 'table_print'

class DataFileParser
  def run
    input = File.read("raw_data.csv")
    structure_data(input)
    @data = @data.sort_by { |entry| entry[:salary] }.reverse
    output_file = File.new("some_nice_lookin_data.txt", "w")
    output_file.write(printed_output)
  end

  def structure_data(raw_input)
    entries = raw_input.split("\n")
    @data = []
    entries.map do |entry|
      individual_info = {}
      features = entry.split(",")
      individual_info[:l_name] = features[0]
      individual_info[:f_name] = features[1]
      individual_info[:salary] = format_salary(features[2])
      @data << individual_info
    end
  end

  def format_salary(salary)
    output = ""
    index = -1
    while salary[index]
      if index % 3 == 2 && index < -1
        output.prepend(",")
      end
      output.prepend(salary[index])
      index -= 1
    end
    output.prepend("$")
    output
  end

  def printed_output
    output = title_line + line_of_dashes
    @data.each {|entry| output += entry_line(entry) }
    output
  end

  def title_line
    word_and_spaces("Last", :l_name) + 
    word_and_spaces("First", :f_name) + 
    word_and_spaces("Salary", :salary) + "\n"
  end

  def line_of_dashes
    "-" * line_length + "\n"
  end

  def line_length
    max_length(:f_name) + max_length(:l_name) + max_length(:salary) + 3
  end

  def entry_line(entry)
    word_and_spaces(entry[:f_name], :f_name) + 
    word_and_spaces(entry[:l_name], :l_name) +
    word_and_spaces(entry[:salary], :salary) + "\n"
  end

  def word_and_spaces(word, column_symbol)
    word + " " * num_of_spaces_to_add(word, column_symbol)
  end

  def num_of_spaces_to_add(word, column_symbol)
    max_length(column_symbol) + 1 - word.length
  end

  def max_length(column_symbol)
    entry = @data.max_by { |entry| entry[column_symbol].length }
    entry[column_symbol].length
  end
end

DataFileParser.new.run