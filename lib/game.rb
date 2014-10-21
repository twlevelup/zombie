require_relative "commands"
require_relative "command"
require_relative "human"
require_relative "board"
require_relative "point"
require_relative "direction"

class Game
  attr_reader :human
  attr_reader :board

  def initialize(human_starting_point)
    @human = Human.new
    @board = Board.new(10)
    @board.put(human_starting_point, @human)
    @human.board = @board
    create_commands
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

  # :nocov:
  def game_loop
    command = gets.chomp
    exec_command(command)
    game_loop
  end
  # :nocov:
end
