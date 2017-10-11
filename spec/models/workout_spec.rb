require 'rails_helper'

RSpec.describe Workout, type: :model do
  before :each do
		person3 = Person.create!(name: "coach", email: "coach@coach.com",
 	  phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")

    coach = Coach.create!(person_id: person3.id)
    @workout = Workout.new(coach_id: coach.id)
    
  end
    
  it "should be pass" do
    expect(@workout).to be_valid
  end


  it "coach_id should be present" do
    @workout.coach_id = nil
    expect(@workout).to_not be_valid
  end
    
end
