Customer  = Struct.new(:name, :email) do
  def name_with_email
    "#{name} <#{email}>"
  end
end

customer = Customer.new("Hara", "harachung90@gmail.com")
# puts customer.inspect
# puts customer.name_with_email
customer.each_pair do |name, value|
  puts "#{name} - #{value}"
end