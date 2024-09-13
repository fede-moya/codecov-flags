# change blob id
class Fish
  def initialize(name)
    @name = name
  end

  def eyes(qty)
    puts "this fish has #{qty.to_s} eyes"
  end

  def self.hi
    "hi"
  end

  def some_new_method
    "some new method"
  end
end
