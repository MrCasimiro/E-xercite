require 'rails_helper'

RSpec.describe User, type: :model do
  
=begin Dummy test
  begin=
  it "the truth" do 
  	assert true
  end
=end
	before :each do
		@user = User.new(name: "Guilherme Casimiro", email: "guircasimiro@gmail.com",
		 password: "123456", password_confirmation: "123456", age: 21,
		 gender: "Male", lesionHistory: "Nope", diseases: "Nope", restrictions: "Nope")
	end

	it "should be valid" do
		expect(@user).to be_valid
	end

	it "name should be present" do
		@user.name = "     "
		expect(@user).to_not be_valid
	end

	it "email should be present" do
		@user.email = "     "
		expect(@user).to_not be_valid
	end

	it "password should be present" do
		@user.password = @user.password_confirmation = " " *6
		expect(@user).to_not be_valid
	end

	it "age should be present" do
		@user.age = nil
		expect(@user).to_not be_valid
	end

	it "gender should be present" do
		@user.gender = "     "
		expect(@user).to_not be_valid
	end

	it "lesion history should be present" do
		@user.lesionHistory = "     "
		expect(@user).to_not be_valid
	end

	it "diseases should be present" do
		@user.diseases = "     "
		expect(@user).to_not be_valid
	end

	it "restrictions should be present" do
		@user.restrictions = "     "
		expect(@user).to_not be_valid
	end

	it "name should not be too long" do
		@user.name = "a" * 51
		expect(@user).to_not be_valid
	end

	it "email should not be too long" do
		@user.email = "a" * 244 + "@example.com"
		expect(@user).to_not be_valid
	end

	it "password should not be too short" do
		@user.password = @user.password_confirmation = "a" * 5
		expect(@user).to_not be_valid
	end

	it "email address validation should accept valid emails" do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address| 
        	@user.email = valid_address
        	expect(@user).to be_valid, "#{valid_address} should be valid"
        end
    end

    it "email address validation should not accept invalid emails" do
    	invalid_address = %w[user@example,com user_at_foo.com user-a-test@ba+.com user_name@foo.com@baar.com]

    	invalid_address.each do |invalid_address| 
    		@user.email = invalid_address
    		expect(@user).to_not be_valid, "#{invalid_address} should not be accept"
    	end
    end
  
  	it "email address should be unique" do
  		duplicate_user = @user.dup
  		duplicate_user.email = @user.email.upcase # foo@aaa.com has to be equal to FOO@aaa.com
  		@user.save
  		expect(duplicate_user).to_not be_valid
  	end

  	it "email adress should be saved as lower-case" do
  		mixed_case_email = "gUIrCaSimiro@Gmail.CoM"
  		@user.email = mixed_case_email
  		@user.save
  		expect(mixed_case_email.downcase).equal? @user.reload.email
  	end
end
