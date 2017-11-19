class PeopleController < ApplicationController

  def new
  	@person = Person.new
  end

  def create
  	@person = Person.new(person_params)
  	#debugger

  	if @person.save 
      @user = User.create(person_id: @person.id,
       avatar: open("public/images/profile/default.png"))
      sign_in @person
      flash[:success] = "Bem vindo ao aplicativo E-xercite!"
      redirect_to [@person, @user]
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @person = Person.find(params[:id])
    @user = User.find_by(person_id: @person.id)
    if @person.update_attributes(person_params)
      redirect_to profile_person_user_path(person_id: @person.id)
    else
      redirect_to setting_person_user_path(id: @user.id, person_id: @person.id)
    end
  end

  private
  def person_params
  	params.require(:person).permit(:name, :email, :age, :phone,
  		:gender, :password, :password_confirmation)
  end
end
