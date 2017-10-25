require 'rails_helper'

RSpec.describe WorkoutMenuController, type: :controller do
	describe "GET #show" do
	    it "returns http success" do     	
			person = Person.create!(name: "user", email: "user@user.com",
			phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
			get :show, params: {id: User.create(person_id: person.id, level: 0, points: 0, avatar: open("public/images/profile/teste.png"))}
			expect(response).to have_http_status(:success)
	    end
	end
end
