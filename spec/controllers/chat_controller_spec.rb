require 'rails_helper'

RSpec.describe ChatController, type: :controller do

	before :each do
		@person = FactoryGirl.create(:person)
	end

end
