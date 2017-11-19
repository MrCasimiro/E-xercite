class SessionsController < ApplicationController
  def new
  end

  def create
  	@person = Person.find_by(email: params[:session][:email].downcase)
    if @person && @person.valid_password?(params[:session][:password])
    	sign_in @person
      @user = User.find_by(person_id: @person.id)
      @coach = Coach.find_by(person_id: @person.id)
      unless @user.nil?
        redirect_to [@person, @user]
      else
        redirect_to person_coach_path(person_id: @person.id, id: @coach.id)
      end

    else
      flash.now[:danger] = 'Combinação email/senha inválida!'
      render 'new'
    end
  end

  def destroy
    sign_out @person
    redirect_to root_path
  end
end
