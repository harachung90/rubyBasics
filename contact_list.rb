def ask(question, kind="string")
  print question + " "
  answer = gets.chomp
  answer = answer.to_i if kind == "number"
  return answer
end

def add_contact
  contact = {"name" => "", "phone_number" => []}
  contact["name"] = ask("What is the person's name?")
  answer = ""
  while answer != "n"
    answer = ask("Do you want to add a phone number? (Y/N) ")
    if answer == "y"
      phone = ask("Enter a phone number:", "number")
      contact["phone_number"].push(phone)
    end
  end
  contact
end

contact_list = []

answer = ""
while answer != "n"
  contact_list.push(add_contact())
  answer = ask("Add another? (Y/N)")
end

puts "-------"

contact_list.each do |contact|
  puts "Name: #{contact["name"]}"
  if contact["phone_number"].size > 0
    contact["phone_number"].each do |phone_number|
      puts "Phone: #{phone_number}"
    end
  end
  puts "-----\n"
end