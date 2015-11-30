class Character

  attr_accessor :name
  attr_reader :alignment

  def initialize(options = {})
    @name = options.fetch(:name) { nil }
    @alignment = options.fetch(:alignment) { :neutral }
  end

  ALIGNMENT_OPTIONS = [:good, :evil, :neutral]

  def alignment=(value)
    raise ArgumentError, "#{value} is not a valid alignment. Alignment must be either :good, :evil, or :neutral." unless ALIGNMENT_OPTIONS.include?(value)
    @alignment = value
  end

end