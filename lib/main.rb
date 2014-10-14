require "board"
require "zombie"
require "point"
class Main
def place_zombies
b = Board.new(10)
    zombie_point = Point.new(b.size - 1, b.size-1)
    zombie1 = Zombie.new
    zombie2 = Zombie.new
    zombie3 = Zombie.new
    zombie4 = Zombie.new
    b.put(zombie_point, zombie1)
    b.put(zombie_point, zombie2)
    b.put(zombie_point, zombie3)
    b.put(zombie_point, zombie4)
    b.find_all(Zombie)
end
end

