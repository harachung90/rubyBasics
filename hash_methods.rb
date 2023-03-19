hash = { "item" => "bread", "quantity" => 1, "brand" => "Tasty Bread Company" }
puts "Hash: #{hash.inspect}"

print "hash.length: "
puts hash.length

print "hash.invert: "
puts hash.invert

print "hash.shift: "
puts hash.shift.inspect

print "hash:"
puts hash.inspect

hash["item"] = "bread"

puts "hash merging: "
puts hash.inspect

puts "Merged with {'calories' => 100}: "
puts hash.merge({ "calories" => 100})

print "Original hash:"
puts hash.inspect

puts "Merged with {'item' => 'eggs'}"
puts hash.merge({'item' => 'eggs'})