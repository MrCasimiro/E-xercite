class ChatController < ApplicationController
  def index
    session[:conversations] ||= []

    @person = Person.all.where.not(id: current_person)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end
end
