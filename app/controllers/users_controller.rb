class UsersController < ApplicationController

	def show
	  	@user = User.find(params[:id])
  		# debugger # opens a rails console in prompt to debug
  	end

	def index
		@user = User.find(current_person.id)
		redirect_to @user
	end
	
end
