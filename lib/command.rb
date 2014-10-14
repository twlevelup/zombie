class Command
  attr_reader :name

  def initialize(name, action)
    @name = name
    @action = action
  end

  def run
    @action.call
  end

  def ==(other)
    self.name == other.name
  end
end
