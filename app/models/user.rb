class User < ApplicationRecord
	attr_accessor :avatar
	belongs_to :person

	has_many :user_restrictions
	has_many :restrictions, through: :user_restrictions

	has_many :user_do_workouts
	has_many :workouts, through: :user_do_workouts

	has_many :user_diseases
	has_many :diseases, through: :user_diseases

	has_many :chatroom_users 
    has_many :chatrooms, through: :chatroom_users 
    has_many :messages

	mount_uploader :avatar, AvatarUploader
 	validates :avatar, 
 		format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
end
