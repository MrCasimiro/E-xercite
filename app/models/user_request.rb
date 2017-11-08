class UserRequest < ApplicationRecord
	belongs_to :user
	validates :date,:option,:status,:user_id, presence: true
end
