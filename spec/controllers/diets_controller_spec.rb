require 'rails_helper'

RSpec.describe DietsController, type: :controller do
	before :each do
		@person = FactoryGirl.create(:person)
		@coach = FactoryGirl.create(:coach, person_id: @person.id)
		@user = FactoryGirl.create(:user)
		@diet = FactoryGirl.create(:diet)
	end

	it "expect a new diet" do
		sign_in @person
		get :show, params: {coach_id: @coach.id}
		expect(assigns(:diet)).to be_a_new(Diet)
	end

	it "creates a new diet" do
		sign_in @person
		expect do
			post :create, params: {coach_id: @coach.id, diet: @diet.attributes}
		end.to change{Diet.count}
	end
end
