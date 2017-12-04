require 'rails_helper'

RSpec.describe DietMenuController, type: :controller do
	before :each do
		@person = FactoryGirl.create(:person)
		@user = FactoryGirl.create(:user, person_id: @person.id)
	end

	describe "GET #show" do
		it "returns http success" do     
			sign_in @person	
			get :show, params: {user_id: @user.id, id: 1}
			expect(response).to have_http_status(:success)
		end
	end
end
