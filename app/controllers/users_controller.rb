class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
  		#debugger # opens a rails console in prompt to debug
  	end

  	def index
  		@user = User.find(current_person.id)
  		redirect_to @user
  	end

  	def edit
  		@user = User.find(params[:id])
  	end

  	def update
  		@user = User.find(params[:id])
  		if @user.update_attributes(user_params)
	      	# Handle a successful update.
	  	else
	  		render 'edit'
	  	end
	end

	def user_params
      params.require(:user).permit(:avatar)
    end
	
end
