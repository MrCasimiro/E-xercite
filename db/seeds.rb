# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


person1 = Person.create!(name: "admin", email: "admin@admin.com",
 	phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
Admin.create(adm_password: "123456", person_id: person1.id)

person2 = Person.create!(name: "user", email: "user@user.com",
 	phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")
user = User.create(person_id: person2.id, level: 0, points: 0)

person3 = Person.create!(name: "coach", email: "coach@coach.com",
 	phone: "1111111", age: 21, gender: "other", password: "123456", password_confirmation: "123456")

#Populando tabela Person
person4 = Person.create!(name: "Roberto Silva", email: "roberto@email.com",
 	phone: "11986455823", age: 35, gender: "male", password: "roberto.silva", password_confirmation: "roberto.silva")
person5 = Person.create!(name: "Guilherme Ramos", email: "guilherme@email.com",
  phone: "11945685823", age: 21, gender: "male", password: "guilherme", password_confirmation: "guilherme")
person6 = Person.create!(name: "Amanda Funabashi", email: "amanda@email.com",
  phone: "11965489123", age: 65, gender: "female", password: "amanda.fu", password_confirmation: "amanda.fu")
person7 = Person.create!(name: "Barbara Bertho", email: "barbara@email.com",
  phone: "11985201473", age: 18, gender: "female", password: "barbara.ra", password_confirmation: "barbara.ra")
person8 = Person.create!(name: "Julio Delgado", email: "julio@email.com",
  phone: "11957954620", age: 33, gender: "male", password: "julioj", password_confirmation: "julioj")
person9 = Person.create!(name: "Felipe Smith", email: "smith@email.com",
  phone: "11936987562", age: 50, gender: "male", password: "felipao", password_confirmation: "felipao")
person10 = Person.create!(name: "William Boulos", email: "bigode@email.com",
  phone: "11985461309", age: 41, gender: "male", password: "williaoo", password_confirmation: "williaoo")
person11 = Person.create!(name: "Barbara Bertho", email: "barbara@email.com",
    phone: "11985201473", age: 18, gender: "female", password: "barbara.ra", password_confirmation: "barbara.ra")






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

#Populando tabela Food
food1 = Food.create(name_food: "Carne")
food2 = Food.create(name_food: "Frango")
food3 = Food.create(name_food: "Batata Doce")
food4 = Food.create(name_food: "Maçã")
food5 = Food.create(name_food: "Banana")
food6 = Food.create(name_food: "Costela suína")
food7 = Food.create(name_food: "Costela bovina")
food8 = Food.create(name_food: "Alface")
food9 = Food.create(name_food: "Tomate")
food10 = Food.create(name_food: "Escarola")
food11 = Food.create(name_food: "Peito de peru")
food12 = Food.create(name_food: "Queijo branco")
food13 = Food.create(name_food: "Pepino")
food14 = Food.create(name_food: "Rúcula")
food15 = Food.create(name_food: "Queijo mussarela")
food16 = Food.create(name_food: "PVT")
food17 = Food.create(name_food: "Frango grelhado")
food18 = Food.create(name_food: "Picanha")
food19 = Food.create(name_food: "Laranja")
food20 = Food.create(name_food: "Uva")
food21 = Food.create(name_food: "Agrião")
food22 = Food.create(name_food: "Berinjela")
food22 = Food.create(name_food: "Repolho")
food23 = Food.create(name_food: "Pizza de pepperoni")
food24 = Food.create(name_food: "Bolo de fubá")
food25 = Food.create(name_food: "Nozes")
food26 = Food.create(name_food: "Castanha de caju")
food27 = Food.create(name_food: "Salada César")
food28 = Food.create(name_food: "Arroz")
food29 = Food.create(name_food: "Feijão")
food30 = Food.create(name_food: "Macarrão integral")

diet1 = Diet.create(name: "Perda de peso 1", coach_id: coach.id)
diet2 = Diet.create(name: "Ganho de massa 1", coach_id: coach.id)
diet3 = Diet.create(name: "Selíaca 1", coach_id: coach.id)

DietCompose.create(quantity:'100' , hour:'10:00' , day: '20171019' ,food_id: food1.id, diet_id: diet1.id)
DietCompose.create(quantity:'150' , hour:'15:00' , day: '20171029' ,food_id: food2.id, diet_id: diet2.id)

exercise2 = Exercise.create!(name_exercise: "Flexão")
exercise3 = Exercise.create!(name_exercise: "Squat")
exercise4 = Exercise.create!(name_exercise: "Burpee")
