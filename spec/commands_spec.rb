require "spec_helper"
require 'commands'
require 'command'

describe Commands do
  before :each do
    @commands = Commands.new
    @commands.add(Command.new('a_command', nil))
    @commands.add(Command.new('b_command', nil))
    @commands.add(Command.new('c_command', nil))
  end

  describe 'when adding a command' do
    it 'will add if unique' do
      @commands.add(Command.new('d_command', nil))
      expect(@commands.list.size).to eq 4
    end

    it 'will not add if duplicated' do
      @commands.add(Command.new('a_command', nil))
      expect(@commands.list.size).to eq 3
    end
  end

  describe 'when parsing a string representation of a command' do
    it 'will return a command when it exists' do
      expect(@commands.parse('a_command')).to eq Command.new('a_command', nil)
    end

    it 'will return nil when it doesnt exist' do
      expect(@commands.parse('not here')).to eq nil
    end
  end

  describe 'when printing out commands as a string' do
    it 'should print commands out in list order' do
      expect(@commands.to_s).to eq 'Available commands: a_command, b_command, c_command'
    end
  end
end
