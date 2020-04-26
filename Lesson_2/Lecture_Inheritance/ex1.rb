

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class BullDog < Dog
  def swim
    "can't swim!"
  end

  def drink
    "drinking"
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

lou = BullDog.new
puts lou.speak 
puts lou.swim
