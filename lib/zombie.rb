require "object"

class Zombie < Object
  attr_accessor :x, :y

  def initialize(x,y)
  	@x = x
  	@y = y
  end

  def say
    "braaaaaaaaaaaiiiiinnnnnnnnnns"
  end

  def move
  	original_x = x
  	original_y = y
  	
  	loop do
  		@x = @x + Random.new.rand(-1..1)
  		@y = @y + Random.new.rand(-1..1)
  		break if @x != original_x or @y != original_y
  	end
  end
end
