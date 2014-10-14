require "spec_helper"
require "board"
require "direction"
require "point"
require "human"
require "zombie"

describe Board do
  let(:size) { 10 }
  let(:b) { Board.new(size) }
  let(:h) { Human.new }
  let(:human_point) { Point.new(0, size - 1) }
  let(:zombie_point) { Point.new(size - 1, 0) }

  it 'should find item\'s point' do
    b.put(human_point, h)

    # find human
    expect(b.find(h)).to eq human_point

    # nil
    expect(b.find(Human.new)).to be_nil
  end

  it 'should move an item' do
    b.put(human_point, h)

    # move right
    b.move(h, Direction::RIGHT)
    expect(b.find(h)).to eq Point.new(1, 9)

    # move up
    b.move(h, Direction::UP)
    expect(b.find(h)).to eq Point.new(1, 8)

    # move left
    b.move(h, Direction::LEFT)
    expect(b.find(h)).to eq Point.new(0, 8)

    # move down
    b.move(h, Direction::DOWN)
    expect(b.find(h)).to eq Point.new(0, 9)

    # validate number of humans
    expect(b.find_all(Human).count).to eq 1

    # exceptions
    expect { b.move(h, Direction::LEFT) }.to raise_error(IndexError)
    expect { b.move(h, Direction::DOWN) }.to raise_error(IndexError)
    expect { b.move(Human.new, Direction::RIGHT) }.to raise_error(ArgumentError)
  end

  it 'should validate moves' do
    expect(b.valid_move?(Point.new(-1, 5))).to be false
    expect(b.valid_move?(Point.new(0, size))).to be false
    expect(b.valid_move?(Point.new(size - 1, size - 1))).to be true
  end

  it 'should find all zombies' do
    b.put(zombie_point, Zombie.new)
    b.put(zombie_point, Zombie.new)
    b.put(zombie_point, Zombie.new)
    b.put(zombie_point, Zombie.new)

    # find all zombies
    expect(b.find_all(Zombie).count).to eq 4
  end
end
