class SessionsController < ApplicationController
  def new
  end

  def create
  	person = Person.find_by(email: params[:session][:email].downcase)
    if person && person.authenticate(params[:session][:password])
    	log_in person
    	redirect_to person
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
