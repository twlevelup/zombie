require 'spec_helper'
require 'zombie'

describe Zombie do
	it "should moan about brains" do
		z = Zombie.new
    expect(z.say).to eq('braaaaaaaaaaaiiiiinnnnnnnnnns')
	end
end
