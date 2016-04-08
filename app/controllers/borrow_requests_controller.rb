class BorrowRequestsController < ApplicationController

	def create
		@borrowRequest = BorrowRequest.new
		tool = Tool.find(params[:tool_id])

		@borrowRequest.requestedTool = tool
		@borrowRequest.requester = User.find(current_user)

		if tool.user.id == @borrowRequest.requester.id
			flash[:warning] = "You cannot borrow your own tools"
			redirect_to tool_path(tool) and return
		end
		
		if @borrowRequest.save
			flash[:success] = "Borrowed Request sent successfully"
			redirect_to tool_path(tool)
		else
			flash[:warning] = "Nope"
			redirect_to tool_path(tool)

		end

	end
end
