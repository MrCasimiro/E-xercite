FactoryGirl.define do
	factory :person do
		name "Casimiro"
		gender "Male"
		phone "12345678"
		age 21
		password "123456"
		password_confirmation "123456"
		sequence(:email) { |n| "person#{n}@example.com" }
	end

	factory :user do
		character "character/teste2.png"
		person
		after :create do |b|
			b.update_column(:avatar, "default.png")
		end
	end

	factory :coach do
		person
	end

	factory :workout do
		coach
		name "workout test with factory girl"
	end

	factory :exercise do 
		name_exercise "exercise test with factory girl"
	end

	factory :workout_compose do
		workout
		exercise
		set 3
		repetition 15
		technique "technique test with factory girl"
	end

	factory :user_do_workout do
		user
		workout
	end
end