class Board
  def initialize(size)
    @grid = Array.new(size) { Array.new(size) }
  end

  def put(x, y, value)
    @grid[x][y] = value
  end

  def get(x, y)
    @grid[x][y]
  end
end