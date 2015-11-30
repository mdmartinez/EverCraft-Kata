class Character

  attr_accessor :name

  def initialize(options = {})
    @name = options.fetch(:name) { nil }
  end

end