class CommentsController < ApplicationController

	def create 
		@tool = Tool.find(params[:tool_id])

		@comment = @tool.comments.create(comment_params)
		@comment.commenter = User.find_by_id(current_user)

		respond_to do |format|
			if @comment.save
				format.html {redirect_to tool_path(@tool)}
				format.js 
			else
				flash[:warning] = "Your entries was invalid!"
				format.html {redirect_to tool_path(@tool)}
			end
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end
end

