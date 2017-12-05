
require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the WorkoutsHelper. For example:
#
# describe WorkoutsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe WorkoutsHelper, type: :helper do
  	before :each do
  		@user = FactoryGirl.create(:user)
  		@coach = FactoryGirl.create(:coach)
  		@workout = FactoryGirl.create(:workout, coach_id: @coach.id)
  		@workout_compose = FactoryGirl.create(:workout_compose, workout_id: @workout.id)
  	end

	describe "find user workouts" do
		it "verify if the user is related to workout" do
			expect(user_do_workout?(@user, @workout_compose)).to eql(true)
			FactoryGirl.create(:user_do_workout, workout_id: @workout.id, user_id: @user.id)
			expect(user_do_workout?(@user, @workout_compose)).to eql(false)
		end

		it "find coach's workouts" do
			expect(find_workouts(@coach)).to eql (Workout.where(coach_id: @coach.id)).to_a
		end
	end
end
