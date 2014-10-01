class Board
  def initialize(size)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
  end

  def put(x, y, value)
    @grid[x][y] = value
    value.x = x
    value.y = y
  end

  def get(x, y)
    @grid[x][y]
  end

  # width of the board
  def width
    @grid.first.length
  end

  # height of the board
  def height
    @grid.length
  end

  # start x position for the human
  def start_x
    height - 1
  end

  # start y position for the human
  def start_y
    0 # always zero
  end
end
