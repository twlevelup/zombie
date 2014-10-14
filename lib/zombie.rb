require 'direction'

class Zombie	

	def say
		"braaaaaaaaaaaiiiiinnnnnnnnnns"
	end

	def gen_direction

		
		r = rand(4)
			
		# 	@point.x=coord_list[r][0]
		# 	@point.y=coord_list[r][1]

		# end
		if r == 1 then
			return Direction::UP
		elsif r == 2 then
			return Direction::DOWN
		elsif r == 3 then
			return Direction::LEFT
		else
			return Direction::RIGHT
		end
	end
end
