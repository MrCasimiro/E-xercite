Feature: Workout view
	In order to control my workout
	As a system's user 
	I want to be able to view my workouts

	Scenario: Viewing a workout
		Given that I'm a user in System
		And I'm now signed in
		And I have a valid workout
		When I acess my workout page
Then I should be able to see only my workouts