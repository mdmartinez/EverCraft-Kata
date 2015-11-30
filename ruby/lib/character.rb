class Character
  attr_accessor :name, :hit_points
  attr_reader :alignment, :armor_class

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

  def roll
    1 + rand(20)
  end

  def critical_attack(roll)
    roll == 20
  end

  def normal_attack(roll, character)
    roll >= character.armor_class
  end

  def dead?
    @hit_points < 1
  end

  def attack(attacked_character, roll_value)
    case
    when critical_attack(roll_value)
      attacked_character.hit_points -= 2
    when normal_attack(roll_value,attacked_character)
      attacked_character.hit_points -= 1
    end
  end

end