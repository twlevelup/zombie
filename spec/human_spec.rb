require 'rspec'
require 'human'

describe Human do
  it "should yack on about sirs and madams" do
    d = Human.new
    expect(d.say).to eq('Hello, there good sir')
  end
end