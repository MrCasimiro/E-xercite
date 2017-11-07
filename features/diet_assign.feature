Feature: Diet view
	In order to help users with their diets
	As a system's coach
	I want to be able to assign diets to users

	Scenario: Viewing a diet
		Given that I'm a registered coach
		And I'm signed in
		And I have one valid request
		When I acess my diet requests page
		Then I should be able to see a request
		When I acess the assign diet page
		Then I can assign a diet to the request