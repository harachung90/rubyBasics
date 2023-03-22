require './contact'

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.first_name.downcase.include?(search) ||
        contact.last_name.downcase.include?(search)
        results.push(contact)
      end
    end
    print_results("Name search results (#{search})", results)
  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub("-", "")
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub("-", "").include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Phone search results (#{search})", results)
    #
  end

  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Address search results (#{search}", results)
  end

  def print_results(search, results)
    puts search
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
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
emily.add_address("Home", "U 3/Fancy Apartment", "3 Crescent Lane", "Mornington", "VIC", "3931")
address_book.contacts.push(emily)
# address_book.print_contact_list

# address_book.find_by_name('e')
# address_book.find_by_phone_number('2')
address_book.find_by_address("3000")
