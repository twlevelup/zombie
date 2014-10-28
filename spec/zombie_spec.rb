require 'spec_helper'

describe Zombie do
	describe "when raised from the dead" do
		before :each do
			@board = double("board")
			@zombie = Zombie.new(@board)
		end

		it "will now where she is" do
			expect(@zombie.board).to eq(@board)
		end

		it "should moan about brains" do
	    expect(@zombie.say).to eq('braaaaaaaaaaaiiiiinnnnnnnnnns')
		end

		describe "when moving around" do
			before :each do
				allow(@board).to receive(:move)
			end

			it "should return UP when given a non-random parameter (1)" do
				@zombie.move(1)
				expect(@board).to have_received(:move).with(@zombie, Direction::UP)
			end

			it "should return DOWN when given a non-random parameter (2)" do
				@zombie.move(2)
				expect(@board).to have_received(:move).with(@zombie, Direction::DOWN)
			end

			it "should return LEFT when given a non-random parameter (3)" do
				@zombie.move(3)
				expect(@board).to have_received(:move).with(@zombie, Direction::LEFT)
			end

			it "should return RIGHT when given a non-random parameter (0)" do
				@zombie.move(0)
				expect(@board).to have_received(:move).with(@zombie, Direction::RIGHT)
			end
	end
	end
end
