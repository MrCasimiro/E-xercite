Feature: Diet view
	In order to control my diet
	As a system's user
	I want to be able to view my diets

	Scenario: Viewing a diet
		Given that I'm a registered user
		And I'm signed in
		And I have one valid diet
		When I acess my diet page
		Then I should be able to see only my diets