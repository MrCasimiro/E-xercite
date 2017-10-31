Feature: Diet view
	In order to create diets
	As a system's coach
	I want to be able insert new foods on the database

	Scenario: Insert food
		Given that I'm a registered coach
		And I'm signed in
		When I acess foods page
		Then I should be able to insert new foods
		Then the number of foods should be increased by 1