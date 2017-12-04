class RankingsController < ApplicationController
	before_action :authenticate_person!

	def global_ranking
	end

	def local_ranking
		(@users = current_user.friends) << current_user
	end
end
