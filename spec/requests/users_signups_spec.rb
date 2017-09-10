require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "post /signup" do
    it "invalid signup information" do
	    get signup_path

	    expect do
		 	post signup_path, params: {
		   		user: { name: "",
		   				email: "user@invalid",
	     				age: 1234,
	      				phone: "",
	      				gender: "",
	      				lesionHistory: "",
	      				diseases: "",
	      				restrictions: "",
	      				password: "1234",
    					password_confirmation: "1234"
	      			}
	      	}
	    end.to_not change{ User.count }

	    expect(response).to render_template('users/new')
	    #assert_select 'div#<CSS id for error explanation>'
	   	#assert_select 'div.<CSS class for field with error>'

	   	# Test if after posting the url are equal (verifies in new form)
	   	assert_select "form[action='/signup']", true
    end

    it "valid signup information" do
    	get signup_path

    	expect do
    		post signup_path, params: {
    			user: { name: "Exemplo",
    					email: "exemplo@exemplo.com",
    					age: 12,
    					phone: "1111111",
    					gender: "other",
    					lesionHistory: "none",
    					diseases: "none",
    					restrictions: "none",
    					password: "123456",
    					password_confirmation: "123456"
    				}
    		}
    	end.to change {User.count}	
    	follow_redirect!
    	expect(response).to render_template("users/show")
    	expect(flash).to_not be_empty
    end
  end
end
