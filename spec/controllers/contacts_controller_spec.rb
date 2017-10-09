require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

	before :each do
		ActionMailer::Base.deliveries = []
	end

	describe "GET #new" do
		it "returns http success" do
			get :new
			expect(response).to have_http_status(:success)
		end
	end
end
