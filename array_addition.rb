grocery_list = [ "milk", "eggs", "bread" ]
grocery_list << "carrots"
grocery_list.push("potatoes")
grocery_list.unshift("celery")
grocery_list += ["ice cream", "pie"]

grocery_list << 1

puts grocery_list.inspect