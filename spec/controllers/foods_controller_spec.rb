require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
	before :each do
		@coach = FactoryGirl.create(:coach)
	end

	describe "GET #show" do
		it "expect a new workout" do
			get :show, params: {coach_id: @coach.id}
			expect(assigns(:food)).to be_a_new(Food)
		end
	end

end
