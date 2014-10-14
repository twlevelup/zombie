class Game
	def start_game
		human = Human.new
		board = Board.new(5)
		humanStartPoint = Point.new(0,0)
		board.put(humanStartPoint, human)
		
		humanPos = board.find(human)
		puts "Human position is ( #{humanPos.x} , #{humanPos.y} )"
	end


end