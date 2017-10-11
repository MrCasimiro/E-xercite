require 'rails_helper'

RSpec.describe WorkoutCompose, type: :model do
  before :each do
    @workout = Workout.new(set: 3, repetition: 8, technique: "drop-set")
  end
  
  it "should be valid" do
		expect(@workout).to be_valid
	end
  
  it "set should be present" do
		@workout.set = nil
		expect(@workout).to_not be_valid
	end

  it "repetition should be present" do
		@workout.repetition = nil
		expect(@workout).to_not be_valid
	end
  
  it "technique should be present" do
		@workout.technique = "     "
		expect(@workout).to_not be_valid
  end

end
