require 'rails_helper'

RSpec.describe Exercise, type: :model do
  
  before :each do
		@exercise = Exercise.new(name_exercise: Burpee)
  end
  
  it "should be valid" do
		expect(@exercise).to be_valid
  end
  
  it "name should be present" do
		@exercise.name_exercise = "     "
		expect(@exercise).to_not be_valid
  end
  
end
