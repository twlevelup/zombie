require "rspec"
require "board"

describe Board do
  let(:b1) { Board.new(5) }
  let(:b2) { Board.new(7) }

  it 'should return width' do
    expect(b1.width).to eq 5
    expect(b2.width).to eq 7
  end

  it 'should return height' do
    expect(b1.height).to eq 5
    expect(b2.height).to eq 7
  end

  it 'should be the fixed y when the game starts' do
    expect(b1.start_y).to eq 0
    expect(b2.start_y).to eq 0
  end

  it 'should be the fixed x when the game starts' do
    expect(b1.start_x).to eq 4
    expect(b2.start_x).to eq 6
  end

  it 'should retrun current position of a human' do
    human = Human.new
    b1.put(b1.start_x, b1.start_y, human)
    expect(human.x).to eq b1.start_x
    expect(human.y).to eq b1.start_y
    b2.put(b2.start_x, b2.start_y, human)
    expect(human.x).to eq b2.start_x
    expect(human.y).to eq b2.start_y
  end
end
