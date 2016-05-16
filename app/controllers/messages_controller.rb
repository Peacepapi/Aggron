class MessagesController < ApplicationController
	before_action :set_conversation

	def index
		@message = @conversation.messages.new
		@messages = @conversation.messages

		lastMsg = @conversation.messages.where("id > ?", params[:id]).first

		respond_to do |format|
			format.html
			format.json {render json: lastMsg}
		end
	end

	def create
		# new message in conversation
		@message = @conversation.messages.new(message_params)
		respond_to do |format|
			if @message.save
				format.html {redirect_to conversation_messages_path(@conversation)}
			end
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
