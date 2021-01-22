class Person
  
  def initialize(attributes)
    attributes.each do |key, value|
      self.class.attr_accessor(key)
      self.send(("#{key}="), value)
    end
  end

  def save
    sql = <<-SQL
      INSERT INTO person (name, grade)
    SQL
  end

  def self.create_person(hash)
    person = Person.new(hash)
    person.save
    person
  end
end
