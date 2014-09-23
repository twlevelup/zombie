require "object"
require 'board'

class Human < Object
  def say
    "Hello, there good sir"
  end

  def searchZombie(grid)
  	#Shows the location of the zombie, output map with the location of zombie?
  	#For each grid on the board, check if there is zombie, if there is print Z, else print '0'
  	
  	for i in 0...grid.height
  		for j in 0...grid.height
			print grid.get(i,j)
		end
		puts
	end
  	
   end



end
