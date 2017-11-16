class ConversationsController < ApplicationController
  include SessionsHelper
  def create
    if current_user.nil?
      @conversation = Conversation.get(current_coach.id, params[:coach_id])
    else
      @conversation = Conversation.get(current_person.id, params[:person_id])
    end
    add_to_conversations unless conversated?

    respond_to do |format|
      format.js
    end
  end

  def close
    @conversation = Conversation.find(params[:id])

    session[:conversations].delete(@conversation.id)

    respond_to do |format|
      format.js
    end
  end

  private

  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end

  def conversated?
    session[:conversations].include?(@conversation.id)
  end
end
