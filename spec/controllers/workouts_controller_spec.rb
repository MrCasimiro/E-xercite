require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do
	before :each do 
		@user = FactoryGirl.create(:user)
		@coach = FactoryGirl.create(:coach)
		@workout = FactoryGirl.create(:workout)
		@workout_compose = FactoryGirl.create(:workout_compose)
	end

	describe "GET #action" do
		it "returns http success when show" do 
			get :show, params: {coach_id: @coach.id, id_user: @user.id, id: 1}
			expect(response).to have_http_status(:success)
		end

		it "return http success when new" do
			get :new, params: {coach_id: @coach.id, id_user: @user.id, id: 1}
			expect(response).to have_http_status(:success)
		end

		it "return http success when create a workout" do
			expect do
				put :create, params: {
					workout: {
						coach_id: 1,
						name: "aaaa",
						workout_compose_attributes: {
							set: 1,
							repetition: 1,
							technique: "aaa",
							exercise_id: 1
						}
					}, coach_id: 1
				}
			end.to change {Workout.count}
		end

		it "return http success when send a workout to a user" do
			expect do
				put :create_do_workout, params: {
					coach_id: @coach.id,
					id_user: @user.id,
					workout_id: @workout.id
				}
			end.to change {UserDoWorkout.count}
		end
	end
end