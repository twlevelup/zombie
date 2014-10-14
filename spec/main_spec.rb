require "rspec"
require "main"

describe "Main" do
  it "should put 4 zombies on a board" do
    main = Main.new

    expect(main.place_zombies).to eq( [Point.new(9,9), Point.new(9,9), Point.new(9,9), Point.new(9,9)])
  end

end
