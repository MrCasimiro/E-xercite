person1 = Person.create!(name: "admin", email: "admin@admin.com",
 	phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
Admin.create(adm_password: "123456", person_id: person1.id)

person2 = Person.create!(name: "user", email: "user@user.com",
 	phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
user = User.create(person_id: person2.id, level: 0, points: 0, avatar: open("public/images/profile/teste.png"))

person3 = Person.create!(name: "coach", email: "coach@coach.com",
 	phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")

coach = Coach.create!(person_id: person3.id)

Speciality.create!(coach_id: coach.id, name_speciality: "elder")

restriction = Restriction.create!(name_restriction: "laziness") # ok

UserRestriction.create(user_id: user.id, restriction_id: restriction.id)

disease = Disease.create!(name_disease: "Osteoporosis") #ok

UserDisease.create(user_id: user.id, disease_id: disease.id)

workout = Workout.create!(coach_id: coach.id)

exercise = Exercise.create!(name_exercise: "Back") # ok

WorkoutCompose.create(set: 3, repetition: 15, technique: "Some technique",
	exercise_id: exercise.id, workout_id: workout.id)

UserDoWorkout.create(user_id: user.id, workout_id: workout.id)

