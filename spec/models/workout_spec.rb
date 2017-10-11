require 'rails_helper'

RSpec.describe Workout, type: :model do
  before :each do

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
