require "board"

class Formatter
  attr_reader :locations

  def initialize(locations=nil)
    @locations = []
  end
#Take in the board and return the coordinates of all zombies
  def all_zombies(board)
    @board = board
    point_z = @board.find_all(Zombie)
    p "Zombies are at: #{point_z}"
    @locations << point_z
    @locations.flatten!
  end
end