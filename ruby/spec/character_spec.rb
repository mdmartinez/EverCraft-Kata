require 'character'

describe Character do
  let (:character) { Character.new(name: "John") }

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

end