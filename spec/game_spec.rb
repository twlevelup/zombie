require 'spec_helper'
require 'game'
require "human"
require "board"
require "point"

describe Game do
  describe 'on commands execution' do
    before(:each) do
      @game = Game.new
      @game.human = Human.new
      @game.board = Board.new(10)
      @p = Point.new(4, 4)
      @game.human.board = @game.board
      @game.board.put(@p, @game.human)
      @game.create_commands
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
  end
end
