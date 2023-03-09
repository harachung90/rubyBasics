def print_hello(num_of_times)
  i = 0
  while i < num_of_times
    puts "Hello"
    i += 1
  end
end

answer = 0
while answer < 5
  print "How many times do you want to print 'Hello'? (Enter a number greater than 5 to exit) "
  answer = gets.chomp.to_i
  print_hello(answer)
end