class PeopleController < ApplicationController
  def show
	  @person = Person.find(params[:id])
  	# debugger # opens a rails console in prompt to debug
  end

  def new
  	@person = Person.new
  end

  def create
  	@person = Person.new(person_params)
  	#debugger

  	if @person.save
      @user = add_user(@person)
  		log_in @person
  		flash[:success] = "Bem vindo ao aplicativo E-xercite!"
  		redirect_to @user
      
  	else
  		render 'new'
  	end
  end

  private
  def person_params
  	params.require(:person).permit(:name, :email, :age, :phone,
  		:gender, :password, :password_confirmation)
  end

  def add_user(person)
    @user = person.build_user(:level => 0, :points => 0)
    @user.save
    @user
  end
end
