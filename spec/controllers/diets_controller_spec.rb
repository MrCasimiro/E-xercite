require 'rails_helper'

RSpec.describe DietsController, type: :controller do
	before :each do
		@coach = FactoryGirl.create(:coach)
		@user = FactoryGirl.create(:user)
	end

	it "expect a new diet" do
		get :show, params: {coach_id: @coach.id}
		expect(assigns(:diet)).to be_a_new(Diet)
	end
end
