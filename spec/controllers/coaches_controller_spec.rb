require 'rails_helper'

RSpec.describe CoachesController, type: :controller do

	before :each do
		@person = FactoryGirl.create(:person)
	end

	describe "GET #show" do
	    it "returns http success" do 
	    	sign_in @person
	    	get :show, params: {id: Coach.create(person_id: @person.id)}
	    	expect(response).to have_http_status(:success)
	    end
  	end
end
