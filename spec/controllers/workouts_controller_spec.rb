require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do
	before :each do 
		@person = FactoryGirl.create(:person)
		@user = FactoryGirl.create(:user)
		@coach = FactoryGirl.create(:coach, person_id: @person.id)
		@workout = FactoryGirl.create(:workout)
		@workout_compose = FactoryGirl.create(:workout_compose)
	end

	describe "GET #action" do
		it "returns http success when show" do 
			sign_in @person
			get :workouts_page, params: {coach_id: @coach.id, id_user: @user.id, id: 1}
			expect(response).to have_http_status(:success)
		end

		it "return http success when new" do
			sign_in @person
			get :new, params: {coach_id: @coach.id, id_user: @user.id, id: 1}
			expect(response).to have_http_status(:success)
		end

		it "return http success when create a workout" do
			sign_in @person
			expect do
				post :create, params: {
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

		it "return http success when create a workout" do
			sign_in @person
			expect do
				post :create, params: {
					workout: {
						coach_id: 1,
						name: nil,
						workout_compose_attributes: {
							set: nil,
							repetition: nil,
							technique: nil,
							exercise_id: nil
						}
					}, coach_id: 1
				}
			end.to_not change {Workout.count}
			expect(response).to render_template('workouts/new')
		end



		it "return http success when send a workout to a user" do
			sign_in @person
			expect do
				put :create_do_workout, params: {
					coach_id: @coach.id,
					id_user: @user.id,
					workout_id: @workout.id
				}
			end.to change {UserDoWorkout.count}
		end

		it "return http success when view workouts history" do
			sign_in @person
			get :workouts_history, params: {coach_id: @coach.id}
			expect(response).to have_http_status(:success)
		end

		it "return http success when coach scores user" do
			@user_do = UserDoWorkout.create(
				user_id: @user.id,
				workout_id: @workout.id,
				ended: true,
				score: 0
				)

			expect do
				put :workout_score, params: {
					coach_id: @coach.id,
					id_user: @user.id,
					workout_id: @workout.id,
					save: true,
					score: 5
				}				
			end.to change {UserDoWorkout.find_by(user_id: @user.id, workout_id: @workout.id).score}
				 .and change{User.find_by(id: @user.id).points}
		end

	end
end