Feature: Workout view
	In order to control my workout
	As a user workout
	I want to be able to view my workouts
	I want to be able to finish my workouts
	And I want to be able to see my finished workouts

	Scenario: Viewing a workout
		Given that I'm a registered user to workout
		And I'm signed in the system
		And I have one valid workout
		When I acess my workout page
		Then I should be able to see only my workouts to be done
		When I finish my workout 
		Then the number of my finished workouts should be increased by 1
		Then I should be able to see my done workout in the done section