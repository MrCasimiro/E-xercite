Given(/^I have one valid request$/) do
	@requester = Person.create!(name: "user", email: "user@user.com",
	phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
	@user = User.create(person_id: @requester.id, level: 0, points: 0, avatar: open("public/images/profile/teste.png"))
	@current_request = UserRequest.create(date: '20181030', option: 2, status: 0, user_id: @user.id)
end

When(/^I acess my diet requests page$/) do
  visit coach_diet_assign_path(coach_id: @current_coach.id)
end

Then(/^I should be able to see a request$/) do
	page.has_field?('requester_name', :with => @requester.name)
end

When(/^I acess the assign diet page$/) do
	visit coach_choose_diet_path(requester_id: @current_request.user_id, coach_id: @current_coach.id)
end

Then(/^I can assign a diet to the request$/) do
	fill_in "user_eat_diet_diet_id", :with => "2"
	click_button "submit_bt"
end
