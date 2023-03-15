def get_name
  print "Enter your name: "
  name = gets.chomp
  yield name
  name
end

my_name = get_name do |name|
  puts"That's a cool name, #{name}!"
end

puts "My name: #{my_name}"