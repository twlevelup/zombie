require_relative 'direction'

class Zombie
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def say
    "braaaaaaaaaaaiiiiinnnnnnnnnns"
  end

  def move(r = rand(4))
    @board.move(self, Direction.random(r))
  end
end
