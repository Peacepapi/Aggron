class ConversationsController < ApplicationController
	before_action :require_user

	def index
		@conversations = Conversation.all
		@users = User.all
	end

	def create
		#if convo with recipient exist, continue. first is for 1 convo instead of making multiple convo with same recipient 
		if Conversation.with(params[:sender_id], params[:recipient_id]).present?
			@conversation = Conversation.with(params[:sender_id], params[:recipient_id]).first
		else
			@conversation = Conversation.create(conversation_params)
		end
		redirect_to conversation_messages_path(@conversation)
	end

private
	def conversation_params
		params.permit(:sender_id, :recipient_id)
	end
end
