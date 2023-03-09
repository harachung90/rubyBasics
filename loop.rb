loop {
  print "Do you want to continue? (Y/N) "
  answer = gets.chomp.downcase
  if answer == "n"
    break
  end
}