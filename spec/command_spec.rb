require "spec_helper"

describe Command do
  describe 'on init' do
    before :each do
      @command = Command.new('A name', Proc.new {'proc was run'})
    end

    it 'has a name' do
      expect(@command.name).to eq 'A name'
    end

    it 'will == a command with the same name' do
      expect(Command.new('command_a', nil)).to eq Command.new('command_a', nil)
    end

    describe 'when run' do
      it 'will call the proc' do
        expect(@command.run).to eq 'proc was run'
      end
    end
  end
end
