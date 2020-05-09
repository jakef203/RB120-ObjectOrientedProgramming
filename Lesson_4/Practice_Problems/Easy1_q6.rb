
class Cube
  attr_reader :volume
  def initialize(volume)
    @volume = volume
  end

  # def to_s
  #   "Cube with volume of #{volume}"
  # end
end

big_cube = Cube.new(5000)
# p big_cube.instance_variable_get("@volume")
p big_cube.volume
puts big_cube