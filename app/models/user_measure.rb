class UserMeasure < ApplicationRecord
	belongs_to :user
	validates :user_id, :weight, :height, presence: true
end
