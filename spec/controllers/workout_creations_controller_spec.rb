require 'rails_helper'

RSpec.describe WorkoutCreationsController, type: :controller do

	describe "GET #show" do
	    it "returns http success" do 
	    	person = Person.create!(name: "coach", email: "coach3@coach.com",
 					phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
	    	person2 = Person.create!(name: "user", email: "user3@user.com",
 					phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
	    	get :show, params: {id: Coach.create(person_id: person.id), id_user: User.create(person_id: person2.id)}
	    	expect(response).to have_http_status(:success)
	    end
  end

end
