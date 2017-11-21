require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
  	before :each do
  		@person_user = FactoryGirl.create(:person)
  		@person_coach = FactoryGirl.create(:person)
  		@user = FactoryGirl.create(:user, person_id: @person_user.id)
  		@coach = FactoryGirl.create(:coach, person_id: @person_coach.id)
  	end

    it "returns http success" do
      get :new
      expect(response).to be_success
    end

    it "user - return http success when sign in" do
    	post :create, params: {session: {email: @person_user.email, password: @person_user.password}}
    	expect(response).to redirect_to person_user_path(id: @user.id, person_id: @person_user.id)
    end

    it "coach - return http success when sign in" do
    	post :create, params: {session: {email: @person_coach.email, password: @person_coach.password}}
    	expect(response).to redirect_to person_coach_path(id: @coach.id, person_id: @person_coach.id)
    end


    it "destroy the session" do
    	sign_in @person_user
    	delete :destroy, params: {person: @person_user}
    	expect(response).to redirect_to root_path
    end
  end

end
