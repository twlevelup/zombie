require 'spec_helper'
require 'zombie'

describe Zombie do
	let(:zombie) {Zombie.new(0,0)}

  it "should moan about brains" do
    expect(zombie.say).to eq('braaaaaaaaaaaiiiiinnnnnnnnnns')
  end

  # it "should change position when moved" do 
  # 	zombie.move
  # 	expect([zombie.x, zombie.y]).not_to eq([10,10])
  # end

  # it "should move one position" do
  # 	zombie.move
  # 	expect(zombie.x).to be <= 11
  # 	expect(zombie.x).to be >= 9
  # 	expect(zombie.y).to be <= 11
  # 	expect(zombie.y).to be >= 9
  	
  # end

  it "should move to single given coordinate" do
    zombie.move([[1,0]])

    expect([zombie.x, zombie.y]).to eq ([1,0])
  end

  it "should not move if given no coordinates" do
    zombie.move([])

    expect([zombie.x, zombie.y]).to eq([0,0])
  end

  it "should only move to one of the coords in valid list" do
    coords = [[5,5],[4,5],[6,5]]
    
    zombie.move(coords)

    expect(coords).to include([zombie.x, zombie.y])
  end
end