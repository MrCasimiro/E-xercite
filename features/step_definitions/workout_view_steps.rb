Given(/^that I'm a registered user to workout$/) do
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

Given(/^I'm signed in the system$/) do

	visit ("/login")
	fill_in("email_field", :with => @person.email)
	fill_in("pass_field", :with => @person.password)
	click_button("submit_btn")
end

Given(/^I have one valid workout$/) do
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

	@workout = Workout.create(
		name: "Treino A",
		coach_id: coach.id)

	user_do = UserDoWorkout.create(
		user_id: @current_user.id,
		workout_id: @workout.id)
end


When(/^I acess my workout page$/) do
  visit ("/workout_menu/"+@current_user.id.to_s)
end

Then(/^I should be able to see only my workouts$/) do
	page.has_field?('workout_name', :with => @workout.name)
end

