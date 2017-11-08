class UserEatDiet < ApplicationRecord
	belongs_to :user
	belongs_to :diet


	validates :user_id, :diet_id, :finished, :exp_date, presence: true
	validate :expiration_date_cannot_be_in_the_past

	def expiration_date_cannot_be_in_the_past
		if exp_date.present? && exp_date < Date.today
			errors.add(:exp_date, "can't be in the past")
		end
	end

end
