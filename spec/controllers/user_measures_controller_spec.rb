require 'rails_helper'

RSpec.describe UserMeasuresController, type: :controller do
	before :each do
		@person = FactoryGirl.create(:person)
		@user = FactoryGirl.create(:user, person_id: @person.id)
		@measure = FactoryGirl.create(:user_measure, user_id: @user.id)
	end

	describe "successful actions" do
		it "creates a new user_measure" do
			sign_in @person
			expect do
				post :create, params: {
					user_measure: @measure.attributes, user_id: @user.id
				}
			end.to change{UserMeasure.count}
		end
	end
	describe "GET #show" do
		it "returns http success" do
			sign_in @person
			get :show, params: {user_id: @user.id, id: 1}
			expect(response).to have_http_status(:success)
		end
	end
	describe "GET #new" do
		it "returns http success" do
			sign_in @person     	
			get :new, params: {user_id: @user.id, id: 1}
			expect(response).to have_http_status(:success)
		end
	end
end
