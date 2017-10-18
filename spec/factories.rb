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
		person
	end
end