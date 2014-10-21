require 'spec_helper'
require 'game'
require "human"
require "board"
require "point"

describe Game do
  it "should put 4 zombies on a board" do
    g = Game.new
    expect(g.place_zombies).to eq( [Point.new(9,9), Point.new(9,9), Point.new(9,9), Point.new(9,9)])
  end

  describe 'on commands execution' do
    let(:game) { Game.new }

    it 'should move a human in the corresponding direction' do
      # right
      game.exec_command('right')
      expect(game.board.find(game.human)).to eq Point.new(1, 0)

      # up
      game.exec_command('up')
      expect(game.board.find(game.human)).to eq Point.new(1, 1)

      # left
      game.exec_command('left')
      expect(game.board.find(game.human)).to eq Point.new(0, 1)

      # down
      game.exec_command('down')
      expect(game.board.find(game.human)).to eq Point.new(0, 0)
    end

    it "should print a human's position" do
      expect { game.exec_command('SHOW MAP') }.to output(/(0, 0)/).to_stdout
    end

    it 'should print wrong move error' do
      expect { game.exec_command('down') }.to output(/Wrong move/).to_stdout
      expect { game.exec_command('left') }.to output(/Wrong move/).to_stdout
    end

    it 'should print unknown command error' do
      expect { game.exec_command("idon'texist") }.to output(/Unknown command/).to_stdout
    end
  end
end
