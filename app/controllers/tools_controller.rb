class ToolsController < ApplicationController
before_action :set_tool, only: [:edit, :update, :show]
before_action :require_user, except: [:index, :show, :update]
before_action :require_same_user, only: [:edit, :update] 	
	def index
		@tools = Tool.paginate(page: params[:page], per_page: 2)
		@tooltypes = Tooltype.all
	end

	def show
	end

	def new
		@tool = Tool.new
	end

	def edit
	end

	def update
		if @tool.update(tool_params)
			flash[:success] = "Your tool was edited successfully!"
			redirect_to tool_path(@tool)
		else 
			render :edit
		end
	end

	def create
		@tool = Tool.new(tool_params)
		@tool.user = current_user

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
			params.require(:tool).permit(:name, :description, :tooltype_id)
		end

		def set_tool
			@tool = Tool.find(params[:id])
		end

		def require_same_user
			if current_user != @tool.user
				flash[:danger] = "You cannot edit another user's tool"
				redirect_to root_path
			end
		end

end
