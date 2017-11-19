require 'rails_helper'

RSpec.describe PeopleController, type: :controller do

	before :each do
		@person = FactoryGirl.create(:person)
	end

	describe "test actions" do
		it "return show http successful" do
			
		end
	end
end
