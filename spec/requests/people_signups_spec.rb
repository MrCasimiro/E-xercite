require 'rails_helper'

RSpec.describe "PeopleSignups", type: :request do
  describe "post /signup" do
    it "invalid signup information" do
        get signup_path

        expect do
            post signup_path, params: {
                person: { name: "",
                        email: "user@invalid",
                        age: 1234,
                        phone: "",
                        gender: "",
                        password: "1234",
                        password_confirmation: "1234"
                    }
            }
        end.to_not change{ Person.count }

        expect(response).to render_template('people/new')
        #assert_select 'div#<CSS id for error explanation>'
        #assert_select 'div.<CSS class for field with error>'

        # Test if after posting the url are equal (verifies in new form)
        assert_select "form[action='/sign_up']", true
    end

    it "valid signup information" do
        get signup_path

        expect do
            post signup_path, params: {
                person: { name: "Exemplo",
                        email: "exemplo@exemplo.com",
                        age: 12,
                        phone: "1111111",
                        gender: "other",
                        password: "123456",
                        password_confirmation: "123456"
                    }
            }
        end.to change {Person.count}    
        follow_redirect!
        expect(response).to render_template("users/show")
        # expect(flash).to_not be_empty when uncomment the flash in controller uncomment here
    end
  end
end