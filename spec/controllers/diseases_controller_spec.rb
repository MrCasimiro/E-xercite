require 'rails_helper'

RSpec.describe DiseasesController, type: :controller do

	before :each do
		@disease = FactoryGirl.create(:disease)
		@person = FactoryGirl.create(:person)
		@user = FactoryGirl.create(:user, person_id: @person.id)
		@user_disease = FactoryGirl.create(:user_disease, disease_id: @disease.id, user_id: @user.id)
		@disease_attributes = FactoryGirl.attributes_for(:disease, name_disease: "aa")
		@disease_invalid_attributes = FactoryGirl.attributes_for(:disease, name_disease: false)
	end
	describe "Get #action" do
		it "return successful to create" do
			sign_in @person
			expect do
				get :create, params: {disease: @disease.attributes, user_id: @user.id}
			end.to change{Disease.count}
			expect(response).to redirect_to profile_person_user_path(person_id: @person.id,
			 id: @user.id)
		end

		it "return successful to update" do
			sign_in @person
			put :update, params: {user_id: @user.id, disease: @disease_attributes, id: @disease.id}
			expect(response).to redirect_to profile_person_user_path(person_id: @person.id, id: @user.id)
		end

		it "destroy data" do
			sign_in @person
			expect do
				delete :destroy, params: {user_id: @user.id, disease: @disease.attributes, id: @disease.id}
			end.to change{UserDisease.count}
			expect(response).to redirect_to profile_person_user_path(person_id: @person.id,
			 id: @user.id)
		end
	end
end
