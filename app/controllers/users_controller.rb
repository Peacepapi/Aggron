class UsersController < ApplicationController

	def index
		@users = User.paginate(page: params[:page], per_page: 2)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Your account has been create succesfully"
			session[:user_id] = @user.id
			redirect_to tools_path
		else
			render 'new'
		end
	end

	def show
		@user = User.find_by_id(params[:id])
		@tools = @user.tools.paginate(page: params[:page], per_page: 2)
	end

	def edit
		@user = User.find_by_id(params[:id])
	end

	def update
		@user = User.find_by_id(params[:id])
		if @user.update(user_params)
			flash[:success] = "Your profile has been updated successfully"
			redirect_to tools_path
		else
			flash[:warning] = "Invalid entries"
			render 'edit'
		end
	end

	private

		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

end
