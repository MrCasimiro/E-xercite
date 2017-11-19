class ChatsController < ApplicationController
  def index
  	if current_user.nil?
      @coach = current_coach
    else
      @user = current_user
    end
    @conversation = Conversation.get(current_person.id, params[:person_id])
    session[:conversations] ||= []

    @people = Person.all.where.not(id: current_person)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end
end
