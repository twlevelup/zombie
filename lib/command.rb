class Command
  attr_reader :name

  def initialize(name, action)
    @name = name
    @action = action
  end

  def run
    @action.call
  end
end
