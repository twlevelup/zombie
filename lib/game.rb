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
		board = Board.new(5)
		humanStartPoint = Point.new(0,0)
		board.put(humanStartPoint, human)

		humanPos = board.find(human)
		puts "Human position is ( #{humanPos.x} , #{humanPos.y} )"
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
