FactoryGirl.define do
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
end