Given(/^that I'm a registered coach$/) do
	@person = Person.create!(name: "coach", email: "coach@coach.com",
 	phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
	@current_coach = Coach.create!(person_id: @person.id)

end

When(/^I acess foods page$/) do
	visit ("/foods/"+@current_coach.id.to_s)
end

Then(/^I should be able to insert new foods$/) do
	@food_count = Food.count
	fill_in "food_name_food", :with => "ovo cozido"
	click_button "submit_bt"
end

Then(/^the number of foods should be increased by (\d+)$/) do |arg1|
	Food.count.should == @food_count + 1
end

