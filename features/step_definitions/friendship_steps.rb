Given(/^I have a user that is not my friend$/) do
	@person_not_friend = FactoryGirl.create(:person)
	@not_friend = FactoryGirl.create(:user, person_id: @person_not_friend.id)
end

When(/^I acess my friendships page$/) do
	click_link('Amizades')
end

Then(/^I should be able to see friends I don't have$/) do 
	page.should have_content(@not_friend.person.name)
end

When(/^I press to add a friend$/) do
	@friendships = Friendship.where(user_id: @current_user.id).count
	click_link("Solicitar")
end

Then(/^my not accepted friendship's number should increase by (\d+)$/) do |increase|
	Friendship.where(user_id: @current_user.id).count.should == @friendships + increase.to_i
end

#######################################################3

And(/^I have a friendship's request$/) do
	@request_friendship = FactoryGirl.create(:friendship, 
		friend_id: @current_user.id, id: 1)
end

Then(/^I should be able to see a friend's request$/) do
	@requested = User.find(Friendship.find(1).user_id)
	page.should have_content(@requested.person.name)
end

When(/^I press to accept my friend's request$/) do
	@friendships = Friendship.where(friend_id: @current_user.id, accepted: true).count
	click_link('Aceitar')
end

Then(/^my accepted friendship's number should increase by (\d+)$/) do |increase|
	Friendship.where(friend_id: @current_user.id, accepted: true).count.should == @friendships + increase.to_i
end

######################################################

And(/^I have a accepted friendship$/) do
	@person_friend = FactoryGirl.create(:person)
	@friend = FactoryGirl.create(:user, person_id: @person_friend.id)
	@friendship = FactoryGirl.create(:friendship, 
		user_id: @current_user.id, friend_id: @friend.id, accepted: true)
	@friendships = Friendship.where(user_id: @current_user.id).count
end

Then(/^I should be able to see a friendship I have$/) do
	page.should have_content(@friend.person.name)
end

When(/^I press to remove this friendship$/) do
	click_link("Remove")
end 

Then(/^the my friendship's number should decrease by (\d+)$/) do |decrease|
	Friendship.where(user_id: @current_user.id).count.should == @friendships - decrease.to_i 
end

