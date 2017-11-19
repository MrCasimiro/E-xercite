require 'rails_helper'

RSpec.describe PagesController, type: :controller do

	before :each do
		@person_user = FactoryGirl.create(:person)
		@person_coach = FactoryGirl.create(:person)
		@user = FactoryGirl.create(:user, person_id: @person_user.id)
		@coach = FactoryGirl.create(:coach, person_id: @person_coach.id)
	end

	describe "require login" do
		it "user logged in" do
			sign_in @person_user
			get :home, params: {person_id: @person_user, user_id: @user.id}
			expect(response).to redirect_to [@person_user, @user]
		end

		it "coach logged in" do
			sign_in @person_coach
			get :home, params: {person_id: @person_coach, coach_id: @coach.id}
			expect(response).to redirect_to [@person_coach, @coach]
		end
	end
end
