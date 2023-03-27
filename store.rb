module Inventoryable

  def self.included(klass)
    klass.extend(ClassMethods)
    klass.extend(Enumerable)
  end

  module ClassMethods
    def create(attributes)
      object = new(attributes)
      instances.push(object)
      return object
    end

    def each(&block)
      instances.each(&block)
    end

    def in_stock_report
      title = "#{self.to_s} In Stock Report"
      reportable = instances.select { |instance| instance.in_stock? }

      report(title, reportable)
    end

    def report(title, items)
      puts title
      puts "-" * 50
      items.each do |item|
        line = []
        line.push("Item: #{item.attributes[:name]}")
        line.push("Stock: #{item.stock_count}")
        if item.attributes.include?(:size)
          line.push("Size: #{item.attributes[:size]}")
        end
        puts line.join("\t")
      end
      puts "-" * 50
      puts "\n"

    end

    def out_of_stock_report
      title = "#{self.to_s} Out of Stock Report"
      reportable = instances.select { |instance| !instance.in_stock? }

      report(title, reportable)
    end

    def instances
      @instances ||= []
    end

  end

  def stock_count
    @stock_count ||= 0
  end

  def stock_count=(number)
    @stock_count = number
  end

  def in_stock?
    stock_count > 0
  end
end

module Store
  class Shirt
    include Inventoryable
    attr_accessor :attributes

    def initialize (attributes)
      @attributes = attributes
    end
  end

  class Pant
    include Inventoryable
    attr_accessor :attributes

    def initialize (attributes)
      @attributes = attributes
    end
  end

  class Accessory
    include Inventoryable
    attr_accessor :attributes

    def initialize (attributes)
      @attributes = attributes
    end
  end
end

=begin
shirt1 = Shirt.create(name: "MTF", size: "L")
shirt2 = Shirt.create(name: "MTF", size: "M")

shirt1.stock_count = 10

puts Shirt.instances.inspect

puts "Shirt 1 stock counts: %s" % shirt1.stock_count
puts "Shirt 2 stock counts: %s" % shirt2.stock_count

puts "Shirt 1 in stock? %s" % shirt1.in_stock?
puts "Shirt 2 in stock? %s" % shirt2.in_stock?
=end

shirt = Store::Shirt.create(name: "MTF", size: "L")
shirt.stock_count = 10

shirt = Store::Shirt.create(name: "MTF2", size: "L")

shirt = Store::Shirt.create(name: "MTF", size: "M")
shirt.stock_count = 9

pant = Store::Pant.create(name: "Jeans", size: "M")
pant.stock_count = 2

pant = Store::Pant.create(name: "Jeans", size: "S")
pant.stock_count = 4

accessory = Store::Accessory.create(name: "Belt", size: "M")
accessory.stock_count = 1

accessory = Store::Accessory.create(name: "Belt", size: "L")
accessory.stock_count = 1

accessory = Store::Accessory.create(name: "Necklace")
accessory.stock_count = 1

Store::Shirt.in_stock_report
Store::Pant.in_stock_report
Store::Accessory.in_stock_report

Store::Shirt.out_of_stock_report