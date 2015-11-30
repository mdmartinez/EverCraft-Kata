class Character

  attr_accessor :name
  attr_reader :alignment, :armor_class, :hit_points

  def initialize(options = {})
    @name = options.fetch(:name) { nil }
    @alignment = options.fetch(:alignment) { :neutral }
    @armor_class = 10
    @hit_points = 5
  end

  ALIGNMENT_OPTIONS = [:good, :evil, :neutral]

  def alignment=(value)
    raise ArgumentError, "#{value} is not a valid alignment. Alignment must be either :good, :evil, or :neutral." unless ALIGNMENT_OPTIONS.include?(value)
    @alignment = value
  end


end