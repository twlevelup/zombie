require 'spec_helper'
require 'direction'

describe Direction do
	
	it "return all directions" do

		dir = [Direction::UP, Direction::DOWN, Direction::LEFT, Direction::RIGHT]
		expect(dir).to eq(Direction.all_directions)
	end
end