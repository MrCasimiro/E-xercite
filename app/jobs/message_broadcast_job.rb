class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    sender = message.person
    recipient = message.conversation.opposed_person(sender)

    broadcast_to_sender(sender, message)
    broadcast_to_recipient(recipient, message)
  end

  private

  def broadcast_to_sender(person, message)
    ActionCable.server.broadcast(
      "conversations-#{person.id}",
      message: render_message(message, person),
      conversation_id: message.conversation_id
    )
  end

  def broadcast_to_recipient(person, message)
    ActionCable.server.broadcast(
      "conversations-#{person.id}",
      window: render_window(message.conversation, person),
      message: render_message(message, person),
      conversation_id: message.conversation_id
    )
  end

  def render_message(message, person)
    ApplicationController.render(
      partial: 'messages/message',
      locals: { message: message, person: person }
    )
  end

  def render_window(conversation, person)
    ApplicationController.render(
      partial: 'conversations/conversation',
      locals: { conversation: conversation, person: person }
    )
  end
end
