class UserRequest < ApplicationRecord
	belongs_to :user
	validates :date,:type,:status,:user_id, presence: true
end
