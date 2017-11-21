Feature: User data view and update
	In order to receive personalized diets and trainings
	As a system's user
	I want to be able to see and update my data

	Scenario: Viewing and updating my data
		Given that I'm a registered user
		And I'm signed in
		And I have valid data registered
		When I acess my user data page
		Then I should be able to see my data
		When I acess the update data page
		Then I can update my data
		Then the number of user measure register should be increased by 1 