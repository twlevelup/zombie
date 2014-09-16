require 'rspec'
require 'zombie'

describe Zombie do
  it "should moan about brains" do
    d = Zombie.new
    expect(d.say).to eq('braaaaaaaaaaaiiiiinnnnnnnnnns')
  end
end
