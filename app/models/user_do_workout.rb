class UserDoWorkout < ApplicationRecord
	belongs_to :user
	belongs_to :workout

	validates :score, :inclusion => {:in => 0..100}
end
