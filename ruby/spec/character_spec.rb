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

end