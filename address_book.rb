require './contact'

class AddressBook
  attr_reader :contacts
  def initialize
    @contacts = []
  end

  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('first_last')
    end
  end
end

address_book = AddressBook.new

jon = Contact.new
jon.first_name = "Jon"
jon.last_name = "Richardson"
jon.add_phone_number("Home", "123-456-789")
jon.add_phone_number("Work", "987-654-321")
jon.add_address("Home", "12 Main St.", "", "Melbourne", "VIC", "3000")

address_book.contacts.push(jon)
# address_book.print_contact_list

emily = Contact.new
emily.first_name = "Emily"
emily.middle_name = "Jane"
emily.last_name = "Bronte"
emily.add_phone_number("Home", "222-222-2222")
emily.add_address("Home", "U 3/Fancy Apartment", "3 Crescent Lane", "Mornington", "VIC", "3931" )
address_book.contacts.push(emily)
address_book.print_contact_list