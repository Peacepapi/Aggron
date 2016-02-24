class CommentsController < ApplicationController

	def new
	end

	def create 
		@tool = Tool.find(params[:tool_id])

		@comment = @tool.comments.create(comment_params)
		@comment.user = User.find_by_id(current_user.id)

		if @comment.save
			flash[:success] = "Thank you for your comments!"
			redirect_to tool_path(@tool)
		else
			flash[:warning] = "Your entries was invalid!"
			redirect_to tool_path(@tool)

		end
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end
end

