require 'rspec'
require 'zombie'

describe Zombie do
	let(:zombie) {Zombie.new(10,10)}

  it "should moan about brains" do
    expect(zombie.say).to eq('braaaaaaaaaaaiiiiinnnnnnnnnns')
  end

  it "should change position when moved" do 
  	zombie.move
  	expect([zombie.x, zombie.y]).not_to eq([10,10])
  end

  it "should move one position" do
  	zombie.move
  	expect(zombie.x).to be <= 11
  	expect(zombie.x).to be >= 9
  	expect(zombie.y).to be <= 11
  	expect(zombie.y).to be >= 9
  	
  end

end