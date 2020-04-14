#namespacing

module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end

buddy = Mammal::Dog.new
buddy.speak('Arf!')
kitty = Mammal::Cat.new
kitty.say_name('kitty')

# Using modules as container for methods, "module methods"

module Mammal

  def self.some_method(num)
    num**2
  end
end

value = Mammal.some_method(4) # preferred way to call module method
# value = Mammal::some_method(4)
p value