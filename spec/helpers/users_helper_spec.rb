require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do

	before :each do 
		@user = FactoryGirl.create(:user)
	end

	describe "return user data" do
		it "return the first disease's name" do
			disease = FactoryGirl.create(:disease)
			FactoryGirl.create(:user_disease, user_id: @user.id, disease_id: disease.id)
			expect(find_diseases(@user)).to eql(disease.name_disease)
		end

		it "return the first restriction's name" do
			restriction = FactoryGirl.create(:restriction)
			FactoryGirl.create(:user_restriction, user_id: @user.id, restriction_id: restriction.id)
			expect(find_restrictions(@user)).to eql(restriction.name_restriction)
		end
	end
end
