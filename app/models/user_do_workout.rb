class UserDoWorkout < ApplicationRecord
	belongs_to :user
	belongs_to :workout

	validates :score, :inclusion => {:in => 0..100}
	validates :ended, :default => false
end
