class ChatMessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'chat_messages_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def chat(data)
    # puts "test"
    # ChatMessagesChannel.broadcast_to('chat_messages_channel', data)
    # Message.create(content: data.fetch('content'))
    ActionCable.server.broadcast('chat_messages_channel', content: data["content"])
  end
end