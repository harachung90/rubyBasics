module Tracking

  def create(name)
    object = new(name)
    instances.push(object)
    return object
  end

  def instances
    @instances ||= []
  end

  def find(name)
    instances.find do |instance|
      instance.name == name
    end
  end
end

class Customer
  extend Tracking
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    "[#{@name}]"
  end
end

puts "Customer.instances: %s" % Customer.instances.inspect
puts "Customer.creates: %s" % Customer.create("Hara")
puts "Customer.creates: %s" % Customer.create("Jon")
puts "Customer.instances: %s" % Customer.instances.inspect

puts "Customer.find('Hara'): %s" % Customer.find("Hara")
puts "Customer.find('Angel'): %s" % Customer.find("Angel")