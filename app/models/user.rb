class User < ApplicationRecord
	attr_accessor :avatar
	VALID_AVATAR_REGEX = /\.(png|jpg|gif)\z/i
	belongs_to :person

	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

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
	validates :avatar, format: {with: VALID_AVATAR_REGEX}
end
