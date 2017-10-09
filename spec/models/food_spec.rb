require 'rails_helper'

RSpec.describe Food, type: :model do
  
before :each do
		@food = Food.new(name_food: "Burguer")
  end
  
  it "should be valid" do
		expect(@food).to be_valid
  end
  
  it "name should be present" do
		@food.name_food= "     "
		expect(@food).to_not be_valid
  end

end
