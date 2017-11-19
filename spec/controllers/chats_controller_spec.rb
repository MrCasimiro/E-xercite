require 'rails_helper'

RSpec.describe ChatsController, type: :controller do

	before :each do
		@person = FactoryGirl.create(:person)
	end

end
