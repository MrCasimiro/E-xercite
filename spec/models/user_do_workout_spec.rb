require 'rails_helper'

RSpec.describe UserDoWorkout, type: :model do

	before :each do

		person3 = Person.create!(name: "coach", email: "coach@coach.com",
		phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
		coach = Coach.create!(person_id: person3.id)

		person = Person.create!(name: "user", email: "user@user.com",
		phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
		user = User.create(person_id: person.id, level: 0, points: 0, avatar: open("public/images/profile/teste.png"))
		
		workout = Workout.create(name: "Treino 1", coach_id: coach.id)
		
		@user_do = UserDoWorkout.create(user_id: user.id, workout_id: workout.id)
	end

  it "should be valid" do
		expect(@user_do).to be_valid
  end

  it "user_id should be present" do
  		@user_do.user_id = ''
		expect(@user_do).to_not be_valid
  end
  it "workout_id should be present" do
  		@user_do.workout_id = ''
		expect(@user_do).to_not be_valid
  end

end
