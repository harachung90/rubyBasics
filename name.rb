class Name

  attr_accessor :title, :first_name, :middle_name, :last_name
  attr_reader :first_and_middle_name

  def initialize(title, first_name, middle_name, last_name)
    @title = title
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    first_and_middle_name = @first_name + " " + @middle_name
    first_and_middle_name + " " + last_name
    #@first_name + " " + @middle_name +  " " + @last_name
  end

  def full_name_with_title
    @title + " " + full_name
  end

  def to_s
    full_name_with_title
  end
end

name = Name.new("Ms.", "Hara", "", "Chung")
puts name.full_name_with_title

nick = Name.new("Dr", "Nick", "Simon", "Pettit")
puts nick.full_name_with_title