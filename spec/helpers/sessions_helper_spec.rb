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
	describe "#current_user" do
		it "current_user nil" do
			assign(:current_user, nil)
      		expect(helper.logged_in?).to eql(false)
  		end
	end	
end