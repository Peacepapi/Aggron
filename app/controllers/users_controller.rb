class UsersController < ApplicationController
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

	def edit
	end

	def update
	end

	private

		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

end
