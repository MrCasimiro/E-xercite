require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	before :each do
		@user = double('user1', id: 2)
		@person = double('person1', id: 1)
	end

	describe "GET #show" do
		it "returns http success" do
			User.should_receive(:find).with('2').and_return(@user)
			get :show, params: {person_id: @person.id, id: @user.id}
		end
	end

end
