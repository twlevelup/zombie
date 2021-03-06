require_relative "commands"
require_relative "command"
require_relative "human"
require_relative "board"
require_relative "point"
require_relative "direction"
require_relative "formatter"

class Game
  attr_reader :human
  attr_reader :board

  def initialize
    @human = Human.new
    @board = Board.new(10)
    @board.put(Point.new(0, 0), @human)
    @human.board = @board
    create_commands
    place_zombies
  end

  def place_zombies
    zombie_point = Point.new(@board.size-1, @board.size-1)
    zombie1 = Zombie.new(@board)
    zombie2 = Zombie.new(@board)
    zombie3 = Zombie.new(@board)
    zombie4 = Zombie.new(@board)
    @board.put(zombie_point, zombie1)
    @board.put(zombie_point, zombie2)
    @board.put(zombie_point, zombie3)
    @board.put(zombie_point, zombie4)
  end

  def create_commands
    @commands = Commands.new
    @commands.add(Command.new('right', proc { @human.move(Direction::RIGHT) }))
    @commands.add(Command.new('down', proc { @human.move(Direction::DOWN) }))
    @commands.add(Command.new('left', proc { @human.move(Direction::LEFT) }))
    @commands.add(Command.new('up', proc { @human.move(Direction::UP) }))
    @commands.add(Command.new('help', proc { puts @commands }))
    @commands.add(Command.new('exit', proc { exit }))

    # display human's and zombies' positions
    @commands.add(Command.new('SHOW MAP', proc do
      puts "Human is at: #{@board.find(@human)}"
      puts "Zombies are at: #{Formatter.new.all_zombies(@board).join(', ')}"
    end))
  end

  def exec_command(command)
    begin
      @commands.parse(command).run
    rescue IndexError
      puts 'Wrong move'
    rescue NoMethodError
      puts 'Unknown command'
    end
  end

  # :nocov:
  def game_loop
    command = gets.chomp
    exec_command(command)
    game_loop
  end
  # :nocov:
end
