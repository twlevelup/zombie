require 'spec_helper'
require 'human'
require "board"
require "direction"
require "point"

describe Human do
  it "should yack on about sirs and madams" do
    d = Human.new
    expect(d.say).to eq('Hello, there good sir')
  end

  it 'should move a human on a board' do
    human = Human.new
    board = Board.new(10)
    board.put(Point.new(0, 0), human)
    human.board = board

    # move right
    human.move(Direction::RIGHT)
    expect(board.find(human)).to eq Point.new(1, 0)

    # move down
    human.move(Direction::DOWN)
    expect(board.find(human)).to eq Point.new(1, 1)

    # move left
    human.move(Direction::LEFT)
    expect(board.find(human)).to eq Point.new(0, 1)

    # move up
    human.move(Direction::UP)
    expect(board.find(human)).to eq Point.new(0, 0)
  end
end
