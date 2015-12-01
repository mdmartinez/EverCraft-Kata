require 'character'

describe Character do
  let (:character) { Character.new(name: "John") }
  let (:second_character) { Character.new(name: "Bill") }

  it "should have a name" do
    expect(character.name).to eq "John"
  end

  it "should be able to set a name" do
    character.name = "Bob"
    expect(character.name).to eq "Bob"
  end

  it "should have an alignment value" do
    expect(character.alignment).to eq :neutral
  end

  it "should have a valid alignment value" do
    expect { character.alignment = :sort_of_good }.to raise_error(ArgumentError)
  end

  it "should have a default armor class of 10" do
    expect(character.armor_class).to eq 10
  end

  it "should have 5 hit points by default" do
    expect(character.hit_points).to eq 5
  end

  it "should be able to attack" do
    expect { character.attack(second_character, character.roll) }.not_to raise_error
  end

  it "should take normal damage after a successful attack" do
    expect{ character.attack(second_character, 11) }.to change{ second_character.hit_points }.by(-1)
  end

  it "should take double damage after a critical attack" do
    expect{ character.attack(second_character, 20) }.to change{ second_character.hit_points }.by(-2)
  end

  it "should be dead when hit points reach 0" do
    3.times { character.attack(second_character, 20) }
    expect(second_character.dead?).to be true
  end

  it "should have the strength, dexterity, constitution, wisdom, intelligence, and charisma attributes" do
    expect(character).to respond_to(:strength, :dexterity, :constitution, :wisdom, :intelligence, :charisma)
  end

  describe "abilities" do
    it "should only allow strength to be between 1 and 20" do
      expect{ character.strength = 21 }.to raise_error(ArgumentError)
      expect{ character.strength = 19 }.to change{character.strength }.from(10).to(19)
    end

    it "should only allow dexterity to be between 1 and 20" do
      expect{ character.dexterity = 21 }.to raise_error(ArgumentError)
      expect{ character.dexterity = 19 }.to change{character.dexterity }.from(10).to(19)
    end

    it "should only allow constitution to be between 1 and 20" do
      expect{ character.constitution = 21 }.to raise_error(ArgumentError)
      expect{ character.constitution = 19 }.to change{character.constitution }.from(10).to(19)
    end

    it "should only allow wisdom to be between 1 and 20" do
      expect{ character.wisdom = 21 }.to raise_error(ArgumentError)
      expect{ character.wisdom = 19 }.to change{character.wisdom }.from(10).to(19)
    end

    it "should only allow intelligence to be between 1 and 20" do
      expect{ character.intelligence = 21 }.to raise_error(ArgumentError)
      expect{ character.intelligence = 19 }.to change{character.intelligence }.from(10).to(19)
    end

    it "should only allow charisma to be between 1 and 20" do
      expect{ character.charisma = 21 }.to raise_error(ArgumentError)
      expect{ character.charisma = 19 }.to change{character.charisma }.from(10).to(19)
    end
  end

  describe "ability modifiers" do
    it "should have modifiers" do
      expect(character.strength_modifier).to eq(0)
      expect(character.dexterity_modifier).to eq(0)
      expect(character.constitution_modifier).to eq(0)
      expect(character.wisdom_modifier).to eq(0)
      expect(character.intelligence_modifier).to eq(0)
      expect(character.charisma_modifier).to eq(0)
    end

    it "the strength modifier should increase strength when above 10" do
      expect{ character.strength = 20 }.to change{ character.strength_modifier}.from(0).to(5)
    end

    it "the strength modifier should decrease strength when below 10" do
      expect{ character.strength = 1 }.to change{ character.strength_modifier}.from(0).to(-5)
    end

    it "the strength modifier should amplify damage" do
      character.strength = 20
      character.attack(second_character,20)
      expect(second_character.dead?).to be true
    end

    it "the dexterity modifier should increase armor class" do
      second_character.dexterity = 20
      character.attack(second_character, 14)
      expect(second_character.hit_points).to eq(5)
    end

    it "the constitution modifier should amplify hit points" do
      character.strength = 20
      second_character.constitution = 14
      character.attack(second_character,19)
      expect(second_character.dead?).to be false
    end
  end

  it "has experience points" do
    expect(character.experience_points).to eq(0)
  end

  it "gains experience when attacking" do
    expect{ character.attack(second_character,15) }.to change{ character.experience_points }.by(10)
  end

  it "levels up on each 1000xp gain" do
    expect{ character.experience_points+= 1000 }.to change{ character.level }.by(1)
    expect{ character.experience_points+= 2000 }.to change{ character.level }.by(2)
  end

  it "should have increased hp at higher levels" do
    expect{ character.experience_points+= 1000 }.to change{ character.hit_points }.by(5)
  end

  it "should increase damage by 1 for each level" do
    expect{ character.experience_points+= 1000 }.to change{ character.normal_damage }.by(1)
  end
end