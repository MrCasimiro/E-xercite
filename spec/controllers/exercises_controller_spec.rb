require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do

	before :each do
		@person = FactoryGirl.create(:person)
		@coach = FactoryGirl.create(:coach, person_id: @person.id)
		@exercise = FactoryGirl.create(:exercise)
	end

	describe "GET #show" do
		it "expect a new exercise" do
			sign_in @person
			get :show, params: {coach_id: @coach.id}
			expect(assigns(:exercise)).to be_a_new(Exercise)
		end

		it "creates a new exercise" do
			sign_in @person
			expect do
				post :create, params: {coach_id: @coach.id,
					exercise: @exercise.attributes}
			end.to change{Exercise.count}
		end
	end

end
