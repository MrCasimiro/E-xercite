require 'rails_helper'

RSpec.describe WorkoutCreationsController, type: :controller do

	before :each do 
		@user = FactoryGirl.create(:user)
		@coach = FactoryGirl.create(:coach)
	end

	describe "GET #show" do
	    it "returns http success" do 
	    	get :show, params: {coach_id: @coach.id, id_user: @user.id, id: 1}
	    	expect(response).to have_http_status(:success)
	    end
  end

end
