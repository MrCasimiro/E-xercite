require 'rails_helper'

RSpec.describe WorkoutCompose, type: :model do
  before :each do
		exercise1 = Exercise.create(name_exercise: "Flexão")
		person3 = Person.create!(name: "coach", email: "coach@coach.com",
 	phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")

		coach = Coach.create!(person_id: person3.id)
		workout1 = Workout.create(name: "Treino A", coach_id: coach.id)
		@workout_compose = WorkoutCompose.new(set: 3, repetition: 10 , technique: 'drop-set' ,exercise_id: exercise1.id, workout_id: workout1.id)
  end
  
  it "should be valid" do
		expect(@workout_compose).to be_valid
  end

  it "set should be > 0" do
  		@workout_compose.set = -1
		expect(@workout_compose).to_not be_valid
  end
  
  it "repetition should be > 0" do
  		@workout_compose.repetition = -1
		expect(@workout_compose).to_not be_valid
  end

  it "technique should be present" do
		@workout_compose.technique= "     "
		expect(@workout_compose).to_not be_valid
  end

  it "exercise_id should be present" do
		@workout_compose.exercise_id = nil
		expect(@workout_compose).to_not be_valid
  end
  it "workout_id should be present" do
		@workout_compose.workout_id = nil
		expect(@workout_compose).to_not be_valid
  end

  
end
