require 'rails_helper'

RSpec.describe Person, type: :model do
  	before :each do
		@person = Person.new(name: "Guilherme Casimiro", email: "guircasimiro@gmail.com",
		 password: "123456", password_confirmation: "123456", age: 21,
		 gender: "Male")
	end

	it "should be valid" do
		expect(@person).to be_valid
	end

	it "name should be present" do
		@person.name = "     "
		expect(@person).to_not be_valid
	end

	it "email should be present" do
		@person.email = "     "
		expect(@person).to_not be_valid
	end

	it "password should be present" do
		@person.password = @person.password_confirmation = " " *6
		expect(@person).to_not be_valid
	end

	it "age should be present" do
		@person.age = nil
		expect(@person).to_not be_valid
	end

	it "gender should be present" do
		@person.gender = "     "
		expect(@person).to_not be_valid
	end

	it "name should not be too long" do
		@person.name = "a" * 51
		expect(@person).to_not be_valid
	end

	it "email should not be too long" do
		@person.email = "a" * 244 + "@example.com"
		expect(@person).to_not be_valid
	end

	it "password should not be too short" do
		@person.password = @person.password_confirmation = "a" * 5
		expect(@person).to_not be_valid
	end

	it "email address validation should accept valid emails" do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address| 
        	@person.email = valid_address
        	expect(@person).to be_valid, "#{valid_address} should be valid"
        end
    end

    it "email address validation should not accept invalid emails" do
    	invalid_address = %w[user@example,com user_at_foo.com user-a-test@ba+.com user_name@foo.com@baar.com]

    	invalid_address.each do |invalid_address| 
    		@person.email = invalid_address
    		expect(@person).to_not be_valid, "#{invalid_address} should not be accept"
    	end
    end
  
  	it "email address should be unique" do
  		duplicate_person = @person.dup
  		duplicate_person.email = @person.email.upcase # foo@aaa.com has to be equal to FOO@aaa.com
  		@person.save
  		expect(duplicate_person).to_not be_valid
  	end

  	it "email adress should be saved as lower-case" do
  		mixed_case_email = "gUIrCaSimiro@Gmail.CoM"
  		@person.email = mixed_case_email
  		@person.save
  		expect(mixed_case_email.downcase).equal? @person.reload.email
  	end
end
