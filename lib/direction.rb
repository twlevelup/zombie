class Direction
  LEFT = 'Left'
  RIGHT = 'Right'
  UP = 'Up'
  DOWN = 'Down'

  def self.all_directions
  	return [UP, DOWN, LEFT, RIGHT]
  end

  def self.random(seed)
    if seed == 1
      return UP
    elsif seed == 2
      return DOWN
    elsif seed == 3
      return LEFT
    elsif seed == 0
      return RIGHT
    end
  end
end
