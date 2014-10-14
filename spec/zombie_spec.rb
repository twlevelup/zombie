require 'spec_helper'
require 'zombie'
require 'direction'

describe Zombie do
	let(:zombie) {Zombie.new}
	
	it "should moan about brains" do
    expect(zombie.say).to eq('braaaaaaaaaaaiiiiinnnnnnnnnns')
	end

	it "should return random direction" do

		expect(Direction.all_directions).to include(zombie.gen_direction)
	end
end
