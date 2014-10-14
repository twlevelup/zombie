require "rspec"

describe "Main" do
  it "should print zombie's location" do
    output = `ruby lib/main.rb`
    expect(output).to eq("Zombies are located at\n")
  end
end
