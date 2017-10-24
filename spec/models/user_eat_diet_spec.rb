require 'rails_helper'

RSpec.describe UserEatDiet, type: :model do

	before :each do

		person3 = Person.create!(name: "coach", email: "coach@coach.com",
		phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
		coach = Coach.create!(person_id: person3.id)

		person = Person.create!(name: "user", email: "user@user.com",
		phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
		user = User.create(person_id: person.id, level: 0, points: 0, avatar: open("public/images/profile/teste.png"))
		
		diet = Diet.create(name: "Perda de peso 1", coach_id: coach.id)
		
		@user_eat = UserEatDiet.create(user_id: user.id, diet_id: diet.id, exp_date: '20181030', finished: 0)
	end

  it "should be valid" do
		expect(@user_eat).to be_valid
  end

  it "exp_date should be > 0" do
  		@user_eat.exp_date = '20121030'
		expect(@user_eat).to_not be_valid
  end
  it "user_id should be present" do
  		@user_eat.user_id = ''
		expect(@user_eat).to_not be_valid
  end
  it "diet_id should be present" do
  		@user_eat.diet_id = ''
		expect(@user_eat).to_not be_valid
  end
  it "finished should be present" do
  		@user_eat.finished = nil
		expect(@user_eat).to_not be_valid
  end
  it "exp_date should be present" do
  		@user_eat.exp_date = ''
		expect(@user_eat).to_not be_valid
  end


end
