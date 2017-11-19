require 'rails_helper'

RSpec.describe RestrictionsController, type: :controller do

	before :each do
		@restriction = FactoryGirl.create(:restriction)
		@person = FactoryGirl.create(:person)
		@user = FactoryGirl.create(:user, person_id: @person.id)
		@user_restriction = FactoryGirl.create(:user_restriction,
		 restriction_id: @restriction.id, user_id: @user.id)
		@restriction_attributes = FactoryGirl.attributes_for(:restriction, name_restriction: "aa")
		@restriction_invalid_attributes = FactoryGirl.attributes_for(:restriction, name_restriction: false)
	end

	describe "Get #action" do
		it "return successful to create" do
			sign_in @person
			expect do
				get :create, params: {restriction: @restriction.attributes, user_id: @user.id}
			end.to change{Restriction.count}
			expect(response).to redirect_to profile_person_user_path(person_id: @person.id,
			 id: @user.id)
		end

		it "return successful to update" do
			sign_in @person
			put :update, params: {user_id: @user.id, 
				restriction: @restriction_attributes, id: @restriction.id}
			expect(response).to redirect_to profile_person_user_path(person_id: @person.id, id: @user.id)
		end

		it "destroy data" do
			sign_in @person
			expect do
				delete :destroy, params: {user_id: @user.id, 
					restriction: @restriction.attributes, id: @restriction.id}
			end.to change{UserRestriction.count}
			expect(response).to redirect_to profile_person_user_path(person_id: @person.id,
			 id: @user.id)
		end
	end
end
