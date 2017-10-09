require 'rails_helper'

RSpec.describe DietCompose, type: :model do
  
before :each do
		food1 = Food.create(name_food: "Carne")
		person3 = Person.create!(name: "coach", email: "coach@coach.com",
 	phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")

		coach = Coach.create!(person_id: person3.id)
		diet1 = Diet.create(name: "Perda de peso 1", coach_id: coach.id)
		@diet_compose = DietCompose.new(quantity: 10, hour:'10:00' , day: '20171019' ,food_id: food1.id, diet_id: diet1.id)
  end
  
  it "should be valid" do
		expect(@diet_compose).to be_valid
  end

  it "quantity should be > 0" do
  		@diet_compose.quantity = -1
		expect(@diet_compose).to_not be_valid
  end
  
  it "hour should be present" do
		@diet_compose.hour= "     "
		expect(@diet_compose).to_not be_valid
  end

  it "day should be present" do
		@diet_compose.day= "     "
		expect(@diet_compose).to_not be_valid
  end

  it "food_id should be present" do
		@diet_compose.food_id = nil
		expect(@diet_compose).to_not be_valid
  end
  it "diet_id should be present" do
		@diet_compose.diet_id = nil
		expect(@diet_compose).to_not be_valid
  end



end
