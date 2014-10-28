require 'spec_helper'

describe Direction do

	it "return all directions" do

		dir = [Direction::UP, Direction::DOWN, Direction::LEFT, Direction::RIGHT]
		expect(dir).to eq(Direction.all_directions)
	end

	it "will return up" do
		expect(Direction.random(1)).to eql(Direction::UP)
	end

	it "will return down" do
		expect(Direction.random(2)).to eql(Direction::DOWN)
	end

	it "will return left" do
		expect(Direction.random(3)).to eql(Direction::LEFT)
	end

	it "will return right" do
		expect(Direction.random(0)).to eql(Direction::RIGHT)
	end
end
