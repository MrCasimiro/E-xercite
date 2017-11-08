Feature: Workout view and creation
	In order to control user's workout
	As a coach
	I want to the coaches can create a workout and send the workout to a specific user
	So the user can have the workouts prepared by coach

	Scenario: Send a workout to an user
		Given I am a registered coach
		Given a specific user
		Given there is a workout that isn't already sent to user
		Given I am log in
		Given I am on the coach's root path
		When I go to the link in "Montar Treino" for this specific user
		Then I should be on user's workout page
		When I send the workout to user
		Then the number of user's do workout should be increased by 1

