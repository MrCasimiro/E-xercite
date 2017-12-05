FactoryGirl.define do
	factory :friendship do
		user_id 1
		friend_id 1
		accepted false
	end
	factory :user_measure do
		weight 1.5
		height 1.5
		neck 1.5
		leftbiceps 1.5
		rightbiceps 1.5
		chest 1.5
		waist 1.5
		hips 1.5
		leftthigh 1.5
		rightthigh 1.5
		leftcalve 1.5
		rightcalve 1.5
	end
	factory :user_datum do
		weight 1.5
		height 1.5
		neck 1.5
		chest 1.5
		leftbiceps 1.5
		rightbiceps 1.5
		chest ""
		waist 1.5
		hips 1.5
		leftthigh 1.5
		rightthigh 1.5
		leftcalve 1.5
		rightcalve 1.5
	end
	factory :message do
		chatroom nil
		user nil
		body "MyText"
	end
	factory :chatroom_user do
		chatroom nil
		user nil
	end
	factory :chatroom do
		name "MyString"
	end
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
		name "workout test with factory girl"
		coach
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
		ended false
		score 0
	end

	factory :disease do
		name_disease "Osteoporose"
	end

	factory :user_disease do
		user
		disease
	end

	factory :restriction do
		name_restriction "Preguiça"
	end

	factory :user_restriction do
		user
		restriction
	end

	factory :food do
		name_food "factory food name"
	end  

	factory :diet do
		coach
		name "factory diet name"
	end

	factory :diet_compose do
		food
		diet
		quantity 2
		hour '10:00'
		day '20171019'
	end

	factory :user_eat_diet do
		user
		diet
		exp_date '20171201'
		finished 0
	end
end