require 'rails_helper'

RSpec.describe RankingsController, type: :controller do
	before :each do 
		@person = FactoryGirl.create(:person)
		@user = FactoryGirl.create(:user, person_id: @person.id)
	end

	describe "Show ranking" do
		it "global ranking" do
			sign_in @person
			get :global_ranking, params: {user_id: @user.id}
			expect(response).to have_http_status(:success)
		end

		it "local ranking" do
			sign_in @person
			get :local_ranking, params: {user_id: @user.id}
			expect(response).to have_http_status(:success)
		end
	end
end