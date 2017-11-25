require 'rails_helper'

RSpec.describe Meal, type: :model do
  it "is valid with valid attributes" do
     expect(Meal.new(name: "Cabbage Salad", description: "potato potato potato")).to be_valid
   end
   it "is not valid without a name" do
    meal = Meal.new(name: nil)
    expect(meal).to_not be_valid
  end
   it "is not valid without a description" do
     meal = Meal.new(description: nil)
     expect(meal).to_not be_valid
   end
end
