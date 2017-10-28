Feature: Workout view
	In order to control my workout
	As a user workout
	I want to be able to view my workouts

	Scenario: Viewing a workout
		Given that I'm a registered user
		And I'm signed in the system
		And I have one valid workout
		When I acess my workout page
		Then I should be able to see only my workouts