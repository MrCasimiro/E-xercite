require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

	before :each do
		@form = Contact.new(:name => 'José', :email => 'my.email@my.domain.com', :message => 'Cool')

		@request = if ActionPack.respond_to?(:version) && ActionPack.version >= Gem::Version.new('5.1')
                 ActionController::TestRequest.create(Class.new) # Rails 5.1
             elsif ActionPack.respond_to?(:version) && ActionPack.version >= Gem::Version.new('5.0')
                 ActionController::TestRequest.create # Rails 5
             else
             	ActionController::TestRequest.new
             end

             ActionMailer::Base.deliveries = []
    end

    describe "GET #new" do
        it "returns http success" do
         	get :new
         	expect(response).to have_http_status(:success)
        end
    end

    describe "GET #create" do
    	it "test email is sent" do
    		get :create, params: {id: @form.id}
    		expect(response).to have_http_status(:success)
    	end
    end


end
