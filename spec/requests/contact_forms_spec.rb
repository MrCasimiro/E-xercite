require 'rails_helper'

RSpec.describe "ContactForms", type: :request do
	describe "Testing the response from the contact's form" do
=begin
		it "this form should be validate and presents a green flash" do
			get contact_path
			expect do
				post contact_path, params: {
					contact: {
						name: "Guilherme Casimiro",
						email: "example@example.com",
						message: "Testing"
					}

				}
			end.to change { ActionMailer::Base.deliveries.count }.by(1)
			debugger
			expect(response).to render_template("contacts/new")

			expect(flash).to_not be_empty
			expect(flash[:success]).to match("Thank you for your message!")
		end	
=end

		it "this form should not be validate" do
			get contact_path
			expect do
				post contact_path, params: {
					contact: {
						name: "aaa",
						email: "aaa",
						message: "Testing"
					}
				}
			end

			expect(response).to render_template("contacts/new")
		end
	end
end
