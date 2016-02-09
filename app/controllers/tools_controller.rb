class ToolsController < ApplicationController
	def index
		@tools = Tool.all
	end

	def show
		@tool = Tool.find(params[:id])
	end

	def new
		@tool = Tool.new
	end

	def edit
		@tool = Tool.find(params[:id])
	end

	def update
		@tool = Tool.find(params[:id])
		if @tool.update(tool_params)
			flash[:success] = "Your tool was edited successfully!"
			redirect_to tool_path(@tool)
		else 
			render :edit
		end
	end

	def create
		@tool = Tool.new(tool_params)
		@tool.user = User.find(2)

		if @tool.save
			flash[:success] = "Your tool was created successfully!"
			redirect_to tools_path
		else 
			flash[:warning] = "Your entries was invalid!"
			render :new
		end
	end

	private 

		def tool_params
			params.require(:tool).permit(:name, :description)
		end

end
