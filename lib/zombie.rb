require "object"

class Zombie < Object
	attr_accessor :x, :y

	def initialize(x,y)
		@x = x
		@y = y
	end

	def say
		"braaaaaaaaaaaiiiiinnnnnnnnnns"
	end

	def move(coord_list)

		if coord_list.size > 0
			r = rand(coord_list.size)
			
			@x = coord_list[r][0]
			@y = coord_list[r][1]

		end

	end
end

# 1,1 - 2,1 0,1 1,0 1,2
