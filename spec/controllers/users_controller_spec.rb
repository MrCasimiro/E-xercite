require 'rails_helper'
include SessionsHelper

RSpec.describe UsersController, type: :controller do

	before :each do 
		@person = FactoryGirl.create(:person)
		@user = FactoryGirl.create(:user)
	end

	describe "GET #show" do
		it "returns http success" do
			log_in @person
			get :show, params: {id: @user.id}
			expect(response).to render_template('users/show')
		end
	end

end
