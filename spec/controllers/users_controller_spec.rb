require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	before :each do
		@user = FactoryGirl.create(:user)
		@person = FactoryGirl.create(:person)
		@user_update_attributes = FactoryGirl.attributes_for(:user, character: "public/images/profile/teste4.png")
		@user_update_attributes_failed = FactoryGirl.attributes_for(:user, avatar: "aa.jpg")
	end

	describe "GET #action" do
		it "returns http success show" do
			sign_in @person
			get :show, params: {person_id: @person.id, id: @user.id}
			expect(response).to have_http_status(:success)
		end


		it "returns http success profile" do
			sign_in @person
			get :profile, params: {person_id: @person.id, id: @user.id}
			expect(response).to have_http_status(:success)
		end

		it "returns http success settings" do
			sign_in @person
			get :setting, params: {person_id: @person.id, id: @user.id}
			expect(response).to have_http_status(:success)
		end
	end

	describe "PUT #action" do

		it "valid atribbutes, expect redirect profile" do
			sign_in @person
			put :update, params: {person_id: @person.id, id: @user.id, user: @user_update_attributes}
			expect(response).to redirect_to profile_person_user_path(person_id: @person.id)
		end

		it "invalid attributes, expect render edit" do
			sign_in @person
			put :update, params: {person_id: @person.id, id: @user.id, user: @user_update_attributes_failed}
			expect(response).to render_template('users/setting')
		end
	end

end