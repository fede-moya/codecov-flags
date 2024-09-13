# This is the dog class
#
class Dog
  def initialize(name)
    @name = name
  end

  # This method is currently covered by a test
  def name
    "#{@name}!!!"
  end

  # FIXME: add a condition
  # This method is NOT currently covered by a test
  def age_in_dog_years
    46
  end

  def age_in_human_years
    9
  end

  def bark
    name
  end
end
