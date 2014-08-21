require 'zombie'

RSpec.describe Zombie do
  it "should honk" do
    d = Zombie.new
    expect(d.brains).to eq('braaaaaaaaaaaiiiiinnnnnnnnnns')
  end
end
