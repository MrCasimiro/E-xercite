require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
	before :each do
		@person = FactoryGirl.create(:person)
		@coach = FactoryGirl.create(:coach, person_id: @person.id)
		@food = FactoryGirl.create(:food)
	end

	describe "successful actions" do
		it "expect a new workout" do
			sign_in @person
			get :show, params: {coach_id: @coach.id}
			expect(assigns(:food)).to be_a_new(Food)
		end

		it "creates a new food" do
			sign_in @person
			expect do
				post :create, params: {
					food: @food.attributes, coach_id: @coach.id
				}
			end.to change{Food.count}
		end
	end

end
