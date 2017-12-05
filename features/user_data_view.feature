Feature: User data view
	In order to help coaches assign their diets
	As a system's coach
	I want to be able to the users data before the assign

	Scenario: Viewing auser data
		Given that I'm a registered coach
		And I'm signed in
		And I have one valid request
		When I acess my diet requests page
		Then I should be able to see a request
		And the user that made the request have a valid data
		When I acess the user data page
		Then I should be able to see the users data