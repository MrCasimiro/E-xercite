require 'rails_helper'

RSpec.describe CoachesController, type: :controller do

	before :each do
		@person = FactoryGirl.create(:person)
		@user = FactoryGirl.create(:user)
		@coach = FactoryGirl.create(:coach, person_id: @person.id)
	end

	describe "GET #show" do
	    it "returns http success to coach root page" do 
	    	sign_in @person
	    	get :show, params: {id: @coach.id}
	    	expect(response).to have_http_status(:success)
	    end

	    it "return http success to users profile" do
	    	sign_in @person
	    	get :users_profile, params: {id_user: @user.id,
	    		id: @coach.id, person_id: @person.id}
	    	expect(response).to have_http_status(:success)
	    end
  	end
end
