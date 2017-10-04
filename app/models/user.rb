class User < ApplicationRecord
	belongs_to :person

	has_many :user_restrictions
	has_many :restrictions, through: :user_restrictions

	has_many :user_do_workouts
	has_many :workouts, through: :user_do_workouts

	has_many :user_diseases
	has_many :diseases, through: :user_diseases
end
