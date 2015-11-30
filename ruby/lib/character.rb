class Character
  attr_accessor :name, :hit_points
  attr_reader :alignment, :armor_class, :strength, :dexterity, :constitution, :wisdom, :intelligence, :charisma

  def initialize(options = {})
    @name = options.fetch(:name) { nil }
    @alignment = options.fetch(:alignment) { :neutral }
    @armor_class = 10
    @hit_points = 5
    @strength = 10
    @dexterity = 10
    @constitution = 10
    @wisdom = 10
    @intelligence = 10
    @charisma = 10
  end

  def strength=(value)
    raise ArgumentError, "strength must be between 1 and 20." unless value.between?(1,20)
    @strength = value
  end

  def dexterity=(value)
    raise ArgumentError, "dexterity must be between 1 and 20." unless value.between?(1,20)
    @dexterity = value
  end

  def constitution=(value)
    raise ArgumentError, "constitution must be between 1 and 20." unless value.between?(1,20)
    @constitution = value
  end

  def wisdom=(value)
    raise ArgumentError, "wisdom must be between 1 and 20." unless value.between?(1,20)
    @wisdom = value
  end

  def intelligence=(value)
    raise ArgumentError, "intelligence must be between 1 and 20." unless value.between?(1,20)
    @intelligence = value
  end

  def charisma=(value)
    raise ArgumentError, "charisma must be between 1 and 20." unless value.between?(1,20)
    @charisma = value
  end

  def strength_modifier
    (strength - 10) / 2
  end

  def dexterity_modifier
    (dexterity - 10) / 2
  end

  def constitution_modifier
    (constitution - 10) / 2
  end

  def wisdom_modifier
    (dexterity - 10) / 2
  end

  def intelligence_modifier
    (dexterity - 10) / 2
  end

  def charisma_modifier
    (dexterity - 10) / 2
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

  def normal_attack(character, roll)
    roll >= character.armor_class
  end

  def dead?
    @hit_points < 1
  end

  def attack(attacked_character, roll_value)
    case
    when critical_attack(roll_value)
      attacked_character.hit_points -= 2
    when normal_attack(attacked_character, roll_value)
      attacked_character.hit_points -= 1
    end
  end

end