
theData = 
{ 1 => { first_name: "John",      last_name: "Johnson",    position: "Manager",           separation_date: "2016-12-31" },
  2 => { first_name: "Tou",       last_name: "Xiong",      position: "Software Engineer", separation_date: "2016-10-05" },
  3 => { first_name: "Michaela",  last_name: "Michaelson", position: "District Manager",  separation_date: "2015-12-19" },
  4 => { first_name: "Jake",      last_name: "Jacobson",   position: "Programmer"                                       },
  5 => { first_name: "Jacquelyn", last_name: "Jackson",    position: "DBA"                                              },
  6 => { first_name: "Sally",     last_name: "Weber",      position: "Web Developer",     separation_date: "2015-12-18" } }


# require 'redis'

# r = Redis.new

# theData.each do |id, info|
#   info.each do |category, value|

#     clean_value = value.gsub(' ', '_')

#     clean_key = "#{id}:#{category}"

#     r.set( clean_key, clean_value )

#   end
# end

# -----------------------------------

# # file for holding the commands, in 'append mode'
# f = File.new('redis_commands.txt', 'w')

# theData.each do |id, info|
#   info.each do |category, value|
    
#     # add, i.e.: "SET 2:position Software_Developer"

#     clean_value = value.gsub(' ', '_')

#     clean_key = "#{id}:#{category}"

#     line = "SET #{clean_key} #{clean_value}\n\r"
#     f.write(line)

#   end
# end

# f.close

# puts "execute: cat redis_commands.txt | redis-cli --pipe\n\n"
# puts %x(cat redis_commands.txt | redis-cli --pipe)

# ------------

# check with "$ redis-cli"
#            "$ GET 6:first_name "

