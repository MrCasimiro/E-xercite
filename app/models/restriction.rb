class Restriction < ApplicationRecord
	has_many :user_restrictions
	has_many :users, through: :user_restrictions
end
