require 'nameablee'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name, age)
    super()
    @id = Time.now.to_f
    @name = name
    @age = age
  end

  def correct_name
    @name
  end

  def can_use_services?
    _is_of_age?
  end

  private

  def _is_of_age?
    @age >= 18
  end
end
