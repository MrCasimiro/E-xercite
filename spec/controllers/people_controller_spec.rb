require 'rails_helper'

RSpec.describe PeopleController, type: :controller do

	before :each do
		@person = FactoryGirl.create(:person)
		@user = FactoryGirl.create(:user, person_id: @person.id)
		@person_update_attributes = FactoryGirl.attributes_for(:person, email: "person@person.com")
		@person_invalid_update = FactoryGirl.attributes_for(:person, email: 123)
	end

	describe "test actions" do
		it "return update http successful" do
			sign_in @person
			post :update, params: {id: @person.id, 
				person: @person_update_attributes}
			expect(response).to redirect_to profile_person_user_path(person_id: @person.id)
		end

		it "return unsuccessful update" do
			sign_in @person
			post :update, params: {id: @person.id, 
				person: @person_invalid_update}
			expect(response).to redirect_to setting_person_user_path(person_id: @person.id, id: @user.id)
		end
	end
end
