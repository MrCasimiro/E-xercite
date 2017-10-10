module ProfilesHelper
	def find_diseases(user)
		diseases = Disease.find(UserDisease.find_by(user_id: user.id).disease_id).name_disease
	end

	def find_restrictions(user)
		restrictions = Restriction.find(UserRestriction.find_by(user_id: user.id).restriction_id).name_restriction
	end
end
