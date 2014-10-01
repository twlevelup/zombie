require 'spec_helper'
require 'human'
require 'board'

describe Human do
  it "should yack on about sirs and madams" do
    d = Human.new
    expect(d.say).to eq('Hello, there good sir')
  end

  it "should show where the zombies are" do
  	d = Human.new
  	b = Board.new(10)
  	
  	for i in 0..9
  		for j in 0..9
			b.put(i,j, '0')
		end
	end
	
	b.put(1,3, 'Z')

	d.searchZombie(b)
  end

end