require "spec_helper"
require "board"
require "direction"
require "point"
require "human"
require "zombie"
require "formatter"

describe Formatter do
  let(:size) { 10 }
  let(:f) { Formatter.new }
  let(:b) { Board.new(5) }
  let(:h) { Human.new }
  let(:human_point) { Point.new(0, 4) }
  let(:zombie_one_point) { Point.new(4, 0) }
  let(:zombie_two_point) { Point.new(2, 3) }

  before do
    @z1 = Zombie.new()
    @z2 = Zombie.new()
    b.put(zombie_one_point, @z1)
    b.put(zombie_two_point, @z2)
  end

  it 'should create formatter' do
    expect(@locations).to eq(nil)
  end

  it "should find zombies " do
    expect(f.locations.length).not_to eq(nil)
    expect(f.all_zombies(b).length).to eq(2)
  end

  it "should show zombies' location with x and y" do
    # expect(zombie_one_point.x).to eq(4)
    # expect(zombie_one_point.y).to eq(0)
    # expect(zombie_two_point.x).to eq(2)
    # expect(zombie_two_point.y).to eq(3)
    # It is same as,
    expect(f.locations.first).to eq(@zombie_one_point)
    expect(f.locations.last).to eq(@zombie_two_point)
  end




end