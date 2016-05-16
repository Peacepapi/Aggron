class BorrowRequestsController < ApplicationController

	def createRequest
		@borrowRequest = BorrowRequest.new
		tool = Tool.find(params[:tool_id])

		@borrowRequest.requestedTool = tool
		@borrowRequest.requester = User.find(current_user)

		if tool.owner.id == @borrowRequest.requester.id
			flash[:warning] = "You cannot borrow your own tools"
			redirect_to tool_path(tool) and return
		end
		
		if @borrowRequest.save
			flash[:success] = "Borrowed Request sent successfully"
			redirect_to tool_path(tool)
		else
			flash[:warning] = "An error has occured!"
			redirect_to tool_path(tool)
		end
	end

	def rejectTool
		user = User.find(params[:user_id])
		@request = BorrowRequest.find(params[:id])
		if @request.delete
			flash[:success] = "You successful rejected a requested from #{@request.requester.username}"
			redirect_to user_transaction_status_path(user)
		end
	end

	def lendTool
		user = User.find(params[:user_id])
		@request = BorrowRequest.find(params[:id])
		tool = Tool.find(@request.requestedTool_id)

		tool.borrower = @request.requester

		if tool.save && @request.delete
			flash[:success] = "You lended #{tool.name} to #{tool.borrower.username}"
			redirect_to user_transaction_status_path(user)
		else
			flash[:warning] = "false!"
			redirect_to user_transaction_status_path(user)
		end
	end

	def requestReturn
		user = User.find(params[:user_id])
		tool = Tool.find(params[:tool_id])

		if tool.update_attribute(:requestReturn, true)
			flash[:success] = "You requested for #{tool.name} to be returned to #{tool.owner.username}"
			redirect_to user_transaction_status_path(user)
		else
			flash[:warning] = "error"
			redirect_to user_transaction_status_path(user)
		end
	end

	def acceptReturn
		user = User.find(params[:user_id])
		tool = Tool.find(params[:tool_id])

		if tool.update_attributes(:requestReturn => false,:borrower_id => nil)
			flash[:success] = "You successfully accpeted #{tool.name}"
			redirect_to user_transaction_status_path(user)
		else
			flash[:warning] = "error"
			redirect_to user_transaction_status_path(user)
		end
		
	end
end
