require 'rails_helper'

RSpec.describe UserMeasure, type: :model do
  before :each do
		person2 = Person.create!(name: "user", email: "user@user.com",
		phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
		user = User.create(person_id: person2.id, level: 0, points: 0, avatar: open("public/images/profile/teste.png"))
		@measure = UserMeasure.create(weight: 70, height: 1.72, neck: 45, leftbiceps: 32, rightbiceps: 31, chest: 100, waist: 70, hips: 78, leftthigh: 80, rightthigh: 81, leftcalve: 35, rightcalve: 34,user_id: user.id)

  end

  it "should be pass" do
		expect(@measure).to be_valid
  end
  it "weight should be present" do
		@measure.weight= nil
		expect(@measure).to_not be_valid
  end

  it "height should be present" do
  		@measure.height= nil
		expect(@measure).to_not be_valid
  end
  
  it "user_id should be present" do
		@measure.user_id= nil
		expect(@measure).to_not be_valid
  end
end
