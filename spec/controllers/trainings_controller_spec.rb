require 'rails_helper'

RSpec.describe TrainingsController, type: :controller do
	before :each do
		@user = FactoryGirl.create(:user)
	end
	
	describe "GET #show" do
	    it "returns http success" do 
	    	get :show, params: {user_id: @user.id, id: 1}
	    	expect(response).to have_http_status(:success)
	    end
  end

end
