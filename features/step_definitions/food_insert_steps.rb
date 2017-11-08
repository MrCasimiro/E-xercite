Given(/^that I'm a registered coach$/) do
	@person = FactoryGirl.create(:person)
	@current_coach = Coach.create(person_id: @person.id)
end

Given(/^I'm signed in$/) do

	visit ("/login")
	fill_in("email_field", :with => @person.email)
	fill_in("pass_field", :with => @person.password)
	click_button("submit_btn")
end

When(/^I acess foods page$/) do
	visit ("/coaches/#{@current_coach.id}/foods/")
end

Then(/^I should be able to insert new foods$/) do
	@food_count = Food.count
	fill_in "food_name_food", :with => "ovo cozido"
	click_button "submit_bt"
end

Then(/^the number of foods should be increased by (\d+)$/) do |arg1|
	Food.count.should == @food_count + 1
end

