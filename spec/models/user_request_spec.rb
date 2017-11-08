require 'rails_helper'

RSpec.describe UserRequest, type: :model do
  before :each do
		person2 = Person.create!(name: "user", email: "user@user.com",
		phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
		user = User.create(person_id: person2.id, level: 0, points: 0, avatar: open("public/images/profile/teste.png"))
		@request = UserRequest.create(date: '20181030', option: 2, status: 0, user_id: user.id)
  end
  
  it "should be pass" do
		expect(@request).to be_valid
  end
  

  it "date should be present" do
  		@request.date= nil
		expect(@request).to_not be_valid
  end
  
  it "option should be present" do
		@request.option= nil
		expect(@request).to_not be_valid
  end

  it "status should be present" do
  		@request.status= nil
		expect(@request).to_not be_valid
  end
  
  it "user_id should be present" do
		@request.user_id= nil
		expect(@request).to_not be_valid
  end

end
