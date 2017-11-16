class ChatController < ApplicationController
  def index
  	if current_user.nil?
      @conversation = Conversation.get(current_coach.id, params[:coach_id])
      @coach = current_coach
    else
      @conversation = Conversation.get(current_person.id, params[:person_id])
      @user = current_user
    end
    session[:conversations] ||= []

    @people = Person.all.where.not(id: current_person)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end
end
