class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	# debugger # opens a rails console in prompt to debug
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	#debugger

  	if @user.save
  		flash[:success] = "Bem vindo ao aplicativo E-xercite!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :age, :phone,
  		:gender, :lesionHistory, :diseases, :restrictions,
  		:password, :password_confirmation)
  	end

end
