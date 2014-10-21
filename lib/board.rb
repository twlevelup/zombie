require_relative "point"
require_relative "direction"

class Board
  attr_reader :size # size of the board (width == height)

  def initialize(size)
    # the last dimension is a cell. it may contain multiple items.
    @grid = Array.new(size) { Array.new(size) { Array.new } }
    @size = size
  end

  def put(point, value)
    @grid[point.y][point.x] << value # append value to a cell
  end

  def get(point)
    @grid[point.y][point.x] # returns cell as an array of values
  end

  # iterate through all cells
  def iterate
    @grid.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        cell.each do |item|
          yield(Point.new(x, y), item)
        end
      end
    end
  end

  # find value's point
  def find(value)
    iterate do |point, item|
      return point if value == item # compare instances
    end

    nil # not found
  end

  # find all points of a specific type, e.g. Zombie
  def find_all(type)
    points = []

    iterate do |point, item|
      points << point if item.is_a? type # compare types
    end

    points
  end

  # check whether move is valid or not
  def valid_move?(point)
    (point.x >= 0 && point.x < @size) && (point.y >= 0 && point.y < @size)
  end

  # move value to a specified direction
  def move(value, direction)
    point = find(value)

    if point.nil? # if not found
      fail ArgumentError, 'Value was not found' # raise exception
    else
      x, y = point.x, point.y

      case direction
      when Direction::UP
        y -= 1
      when Direction::DOWN
        y += 1
      when Direction::LEFT
        x -= 1
      when Direction::RIGHT
        x += 1
      end

      new_point = Point.new(x, y) # new point from calculated coordinates

      if valid_move?(new_point)
        put(new_point, value) # move to a new cell
        get(point).delete(value) # delete from an old cell
      else
        fail IndexError, 'Move is not valid' # raise exception
      end
    end
  end
end
