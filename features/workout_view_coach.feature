Feature: Workout view
	In order to control my workout
	As a coach workout
	I want to be able to view all workouts I made

	Scenario: Viewing a workout
		Given that I'm a registered coach
		And I'm signed in
		And I have at least valid workout
		Given I am on the coach's root path
		When I acess my workout history
		Then I should be able to see at least one workout I made