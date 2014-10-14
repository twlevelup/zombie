class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  # equals
  def ==(other)
    other.x == @x && other.y == @y
  end
end
