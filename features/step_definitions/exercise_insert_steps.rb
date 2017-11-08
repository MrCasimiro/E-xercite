Given(/^that I'm a registered coach in system$/) do
	@person = FactoryGirl.create(:person)
	@current_coach = Coach.create(person_id: @person.id)
end

Given(/^I'm signed in the application$/) do

	visit ("/login")
	fill_in("email_field", :with => @person.email)
	fill_in("pass_field", :with => @person.password)
	click_button("submit_btn")
end


When(/^I acess exercises page$/) do
	visit ("/coaches/#{@current_coach.id}/exercises/")
end

Then(/^I should be able to insert new exercises$/) do
	@exercise_count = Exercise.count
	fill_in "exercise_name_exercise", :with => "flexao"
	click_button "submit_bt"
end

Then(/^the number of exercises should be increased by (\d+)$/) do |arg1|
	Exercise.count.should == @exercise_count + 1
end

