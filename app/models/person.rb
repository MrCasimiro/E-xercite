class Person < ApplicationRecord

	has_one :user
	has_one :admin
	has_one :coach

	before_save {email.downcase!} 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates :age, :gender, presence: true
	validates :name, presence: true, length: {maximum: 50}
	validates :email, presence: true, length: {maximum: 255},
	format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

	has_secure_password
	validates :password, presence: true, length: {minimum: 6}

	# Returns the hash digest of the given string.
	def Person.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
													  BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

end
