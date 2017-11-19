require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
	#before :each do
	#	@current_person = FactoryGirl.create(:person)
	#end

	describe "set current coach" do
		it "current_coach already assigned" do
			@current_coach = FactoryGirl.create(:coach)
			expect(current_coach).to eq(@current_coach)
		end

		it "assign a coach to current_coach" do
			expect(current_coach).to eq(nil)
			coach = FactoryGirl.create(:coach, person_id: @current_person.id)
			expect(current_coach).to eql(coach)

		end
	end

	describe "set current user" do
		it "current_user already assigned" do
			@current_user = FactoryGirl.create(:user)
			expect(current_user).to eq(@current_user)
		end

		it "assign a user to current_user" do
			expect(current_user).to eq(nil)
			user = FactoryGirl.create(:user, person_id: @current_person.id)
			expect(current_user).to eql(user)
		end
	end
end
