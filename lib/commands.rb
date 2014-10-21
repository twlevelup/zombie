class Commands
  def initialize
    @commands = []
  end

  def add(command)
    @commands.push(command) if @commands.select {|_command_| _command_ == command}.empty?
  end

  def list
    @commands
  end

  def parse(string)
    @commands.select {|command| command.name.downcase == string.downcase}.first
  end

  def to_s
    "Available commands: #{ @commands.map(&:name).join(", ") }"
  end
end
