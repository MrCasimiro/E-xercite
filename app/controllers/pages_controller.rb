class PagesController < ApplicationController
	before_action :require_login
	include SessionsHelper
 
  	private
 
  	def require_login
    	if person_signed_in?
      		#flash[:error] = "You must be logged in to access this section"
      		if !current_user.nil?
      			redirect_to [current_person, current_user] # halts request cycle
      		elsif !current_coach.nil?
      			redirect_to [current_person, current_coach]
      		end
    	end
  	end
	def home
	end
	def sobre
	end
	def treino
	end
	def gami
	end
end

