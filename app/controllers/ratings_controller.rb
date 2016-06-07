class RatingsController < ApplicationController
	before_action :set_tool, only: :rate
	before_action :require_user, only: :rate
	def new
		@rating = Rating.new
	end

	def rate
		@rating = Rating.create(tool: @tool, reviewer: current_user, like: params[:like])

		if @rating.valid?
			flash[:success] = "Thank You for rating!"
			redirect_to :back 
		else
			flash[:warning] = "You can only rate once."
			redirect_to :back
		end
	end

	private

		def set_tool
			@tool = Tool.find(params[:tool_id])
		end

		def require_same_user
			if current_user == @tool.owner
				flash[:danger] = "You cannot rate tool"
				redirect_to :back
			end
		end

end
