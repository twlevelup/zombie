require "commands"
require "command"
require "human"
require "board"
require "point"
require "direction"

class Game
  attr_accessor :human
  attr_accessor :board

  def start_game
    human = Human.new
    board = Board.new(10)
    humanStartPoint = Point.new(0,0)
    board.put(humanStartPoint, human)
    humanPos = board.find(human)
    puts "Human position is ( #{humanPos.x} , #{humanPos.y} )"
  end

  def place_zombies
    board = Board.new(10)
    zombie_point = Point.new(board.size-1, board.size-1)
    zombie1 = Zombie.new
    zombie2 = Zombie.new
    zombie3 = Zombie.new
    zombie4 = Zombie.new
    board.put(zombie_point, zombie1)
    board.put(zombie_point, zombie2)
    board.put(zombie_point, zombie3)
    board.put(zombie_point, zombie4)
    show_zombie_pos(board, zombie1, zombie2, zombie3, zombie4)
    board.find_all(Zombie)

end

def show_zombie_pos(board, zombie1, zombie2, zombie3, zombie4)
    zombie1_position = board.find(zombie1)
    zombie2_position = board.find(zombie2)
    zombie3_position = board.find(zombie3)
    zombie4_position = board.find(zombie4)
    puts "Zombies postions are: ( #{zombie1_position.x}, #{zombie1_position.y}) ( #{zombie2_position.x}, #{zombie2_position.y}) ( #{zombie3_position.x}, #{zombie3_position.y}) ( #{zombie4_position.x}, #{zombie4_position.y})"
  end

  def create_commands
    @commands = Commands.new
    @commands.add(Command.new('right', proc { @human.move(Direction::RIGHT) }))
    @commands.add(Command.new('down', proc { @human.move(Direction::DOWN) }))
    @commands.add(Command.new('left', proc { @human.move(Direction::LEFT) }))
    @commands.add(Command.new('up', proc { @human.move(Direction::UP) }))
    @commands.add(Command.new('whereami', proc { puts @board.find(@human) }))
    @commands.add(Command.new('help', proc { puts @commands }))
    @commands.add(Command.new('exit', proc { exit }))
  end

  def exec_command(command)
    begin
      @commands.parse(command).run
    rescue IndexError
      puts 'Illegal direction'
    rescue NoMethodError
      puts 'Unknown command'
    end
  end
end
