class PeopleController < ApplicationController
  def show
	@person = Person.find(params[:id])
  	# debugger # opens a rails console in prompt to debug
  end

  def new
  	@person = Person.new
  end

  def create
  	@person = Person.new(user_params)
  	#debugger

  	if @person.save
  		log_in @person
  		flash[:success] = "Bem vindo ao aplicativo E-xercite!"
  		redirect_to @person
  	else
  		render 'new'
  	end
  end

  private
  def person_params
  	params.require(:user).permit(:name, :email, :age, :phone,
  		:gender, :password, :password_confirmation)
  end
end
