require 'spec_helper'
require 'game'
require "human"
require "board"
require "point"

describe Game do
  describe 'on commands execution' do
    before(:each) do
      @p = Point.new(4, 4)
      @game = Game.new(@p)
    end

    it 'should move a human up' do
      @game.exec_command('up')
      expect(@game.board.find(@game.human)).to eq Point.new(@p.x, @p.y - 1)
    end

    it 'should move a human right' do
      @game.exec_command('right')
      expect(@game.board.find(@game.human)).to eq Point.new(@p.x + 1, @p.y)
    end

    it 'should move a human down' do
      @game.exec_command('down')
      expect(@game.board.find(@game.human)).to eq Point.new(@p.x, @p.y + 1)
    end

    it 'should move a human left' do
      @game.exec_command('left')
      expect(@game.board.find(@game.human)).to eq Point.new(@p.x - 1, @p.y)
    end

    it "should print a human's position" do
      expect { @game.exec_command('whereami') }.to output(/(4, 4)/).to_stdout
    end

    it 'should print unknown command error' do
      expect { @game.exec_command("idon'texist") }.to output(/Unknown command/).to_stdout
    end

    it 'should print illegal direction error' do
      game = Game.new(Point.new(0, 0))
      expect { game.exec_command('up') }.to output(/Illegal direction/).to_stdout
    end
  end
end
