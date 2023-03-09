answer = ""
until answer == "n" do
  print "Do you want this loop to continue? (Y/N) "
  answer = gets.chomp.downcase
end