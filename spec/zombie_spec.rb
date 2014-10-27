require 'spec_helper'

describe Zombie do
	let(:zombie) {Zombie.new}

	it "should moan about brains" do
    expect(zombie.say).to eq('braaaaaaaaaaaiiiiinnnnnnnnnns')
	end

	it "should return UP when given a non-random parameter (1)" do
		expect(zombie.gen_direction(1)).to eq(Direction::UP)
	end

	it "should return DOWN when given a non-random parameter (2)" do
		expect(zombie.gen_direction(2)).to eq(Direction::DOWN)
	end

	it "should return LEFT when given a non-random parameter (3)" do
		expect(zombie.gen_direction(3)).to eq(Direction::LEFT)
	end

	it "should return RIGHT when given a non-random parameter (0)" do
		expect(zombie.gen_direction(0)).to eq(Direction::RIGHT)
	end

	it "should return either UP, DOWN, LEFT, RIGHT when given no paramater" do
		expect(Direction.all_directions).to include(zombie.gen_direction)
	end

end
