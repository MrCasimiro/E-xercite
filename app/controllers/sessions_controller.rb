class SessionsController < ApplicationController
  def new
  end

  def create
  	person = Person.find_by(email: params[:session][:email].downcase)
    if person && person.authenticate(params[:session][:password])
    	log_in person
      @user = User.find_by(person_id: person.id)
      @coach = Coach.find_by(person_id: person.id)
    	unless @user.blank?
        redirect_to @user
      else
        redirect_to @coach
      end

    else
      flash.now[:danger] = 'Combinação email/senha inválida!'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
