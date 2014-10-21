class Human
  attr_writer :board

  def say
    "Hello, there good sir"
  end

  def move(direction)
    @board.move(self, direction)
  end
end
