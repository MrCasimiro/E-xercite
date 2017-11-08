class UsersController < ApplicationController
  before_action :authenticate_person!
	def show
		@user = User.find(params[:id])
  		#debugger # opens a rails console in prompt to debug
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
		@user = User.find(params[:id])
 		if @user.update_attributes(user_params)
      redirect_to profile_person_user_path(person_id: params[:person_id])
  	else
	 		render 'setting'
	  end
	end

  def profile
    @user = User.find(params[:id])
  end

  def setting
    @user = User.find(params[:id])
  end

  private
	def user_params
    params.require(:user).permit(:avatar, :character)
  end
	
end
