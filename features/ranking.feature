Feature: Ranking
	In order to see my avatar rank in system ranking
	As a user's system
	I want to see my current rank in global or local ranking

	Scenario: Global ranking
		Given I have a user that is not my friend
		Given that I'm a registered user
		And I'm signed in
		When I visit the global rank
		Then I want to see my rank


	Scenario: Local ranking
		Given I have a user that is not my friend
		Given that I'm a registered user
		And I'm signed in
		When I visit the local rank
		Then I want to see my rank

