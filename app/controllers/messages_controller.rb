class MessagesController < ApplicationController
	before_action :set_conversation

	def index
		@message = @conversation.messages.new
		@messages = @conversation.messages
	end

	def new
		@message = @conversation.messages.new
	end

	def create
		# new message in conversation
		@message = @conversation.messages.new(message_params)
		if @message.save
			redirect_to conversation_messages_path(@conversation)
		end
	end
private
	def message_params
		params.require(:message).permit(:body, :user_id)
	end

	def set_conversation
		@conversation = Conversation.find(params[:conversation_id])
	end
end
