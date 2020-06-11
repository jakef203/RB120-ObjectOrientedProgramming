class Animal
  attr_reader :diet
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower) # Added <(diet, superpower)> as a solution
    ##! If you don't specify, the # of arguments to send to super, it will send
    # all of them from the initialize of the class that inherits.
    # It will send diet, superpower, and song to <Animal> class here if you only
    # have <super>, hence the original error of sending three arguments instead of 2
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
unicornfish.superpower
unicornfish.move
p unicornfish.diet

penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')
p robin.diet
robin.superpower 
robin.move

