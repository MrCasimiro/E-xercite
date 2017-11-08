Given(/^that I'm a registered user$/) do
	@person = Person.create!(
		name: "user",
		email: "user@user.com",
		phone: "1111111",
		age: 21,
		gender: "other",
		password: "123456",
		password_confirmation: "123456")

	@current_user = User.create(
		person_id: @person.id,
		level: 0,
		points: 0,
		avatar: open("public/images/profile/teste.png"))
end

Given(/^I'm signed in$/) do

	visit ("/login")
	fill_in("email_field", :with => @person.email)
	fill_in("pass_field", :with => @person.password)
	click_button("submit_btn")
end

Given(/^I have one valid diet$/) do
	person2 = Person.create(
	name: "coach",
	email: "coach@coach.com",
	phone: "1111111",
	age: 21,
	gender: "other",
	password: "123456",
	password_confirmation: "123456")

	coach = Coach.create!(
	person_id: person2.id)

	@diet = Diet.create(
		name: "Perda de peso 1",
		coach_id: coach.id)

	user_eat = UserEatDiet.create(
		user_id: @current_user.id,
		diet_id: @diet.id,
		exp_date: '20181030',
		finished: 0)
end


When(/^I acess my diet page$/) do
  visit ("/diet_menu/"+@current_user.id.to_s)
end

Then(/^I should be able to see only my diets$/) do
	page.has_field?('diet_name', :with => @diet.name)
end

