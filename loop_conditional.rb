random_number = Random.new.rand(5)

loop {
  print "Guess the number between 0 and 5 (e to exit): "
  answer = gets.chomp
  if answer == "e"
    puts "The number was #{random_number}"
    break
  else
    if answer.to_i == random_number
      puts "You guess correctly!"
      break
    else
      puts "Try again!"
    end
  end
}