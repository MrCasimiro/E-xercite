require 'rails_helper'

RSpec.describe TrainingsController, type: :controller do
	before :each do
		@person = FactoryGirl.create(:person)
		@user = FactoryGirl.create(:user, person_id: @person.id)
		@coach = FactoryGirl.create(:coach)
		@workout = FactoryGirl.create(:workout)
	end
	
	describe "GET #show" do
	    it "returns http success" do
	    	sign_in @person 
	    	get :show, params: {user_id: @user.id, id: 1}
	    	expect(response).to have_http_status(:success)
	    end
  end


	it "return http success when user complete a workout" do
		@user_do = UserDoWorkout.create(
			user_id: @user.id,
			workout_id: @workout.id,
			ended: false,
			score: 0
			)
		sign_in @person
		expect do
			put :end_workout, params: {
				user_id: @user.id,
				user_id_wo: @user.id,
				workout_id_wo: @workout.id
			}
		end.to change {UserDoWorkout.where(:ended => true).count}
	end

end
