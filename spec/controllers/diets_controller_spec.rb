require 'rails_helper'

RSpec.describe DietsController, type: :controller do
	before :each do
		@coach = FactoryGirl.create(:coach)
		@user = FactoryGirl.create(:user)
		@diet = FactoryGirl.create(:diet)
	end

	it "expect a new diet" do
		get :show, params: {coach_id: @coach.id}
		expect(assigns(:diet)).to be_a_new(Diet)
	end

	it "creates a new diet" do
		expect do
			post :create, params: {coach_id: @coach.id, diet: @diet.attributes}
		end.to change{Diet.count}
	end
end
