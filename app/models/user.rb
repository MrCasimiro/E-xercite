class User < ApplicationRecord
	attr_accessor :avatar
	belongs_to :person

	has_many :user_restrictions
	has_many :restrictions, through: :user_restrictions

	has_many :user_do_workouts
	has_many :workouts, through: :user_do_workouts

	has_many :user_diseases
	has_many :diseases, through: :user_diseases

	mount_uploader :avatar, AvatarUploader
 	validates :avatar, 
 		format: { with: %r{.(gif|jpg|png)\Z}i,
 		 message: 'must be a URL for GIF, JPG or PNG image.' }

 	has_many :friendships
	has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

	has_many :active_friends, -> { where(friendships: { accepted: true}) },
	 through: :friendships, source: :friend
	has_many :received_friends, -> { where(friendships: { accepted: true}) },
	 through: :received_friendships, source: :user
	has_many :pending_friends, -> { where(friendships: { accepted: false}) },
	 through: :friendships, source: :friend
	has_many :requested_friendships, -> { where(friendships: { accepted: false}) },
	 through: :received_friendships, source: :user

# to call all your friends

	def friends
	 	active_friends | received_friends
	end

# to call your pending sent or received

	def pending
		pending_friends | requested_friendships
	end
end
