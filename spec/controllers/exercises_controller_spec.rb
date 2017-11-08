require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do

	before :each do
		@coach = FactoryGirl.create(:coach)
	end

	describe "GET #show" do
		it "expect a new exercise" do
			get :show, params: {coach_id: @coach.id}
			expect(assigns(:exercise)).to be_a_new(Exercise)
		end
	end

end
