class UsersController < ApplicationController
	#before_action perform methods before all actions(methods), 'only' specify the actions
before_action :set_user, only: [:edit, :update, :show]
before_action :require_same_user, only: [:edit, :update]

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
		@tools = @user.tools.paginate(page: params[:page], per_page: 2)
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = "Your profile has been updated successfully"
			redirect_to user_path(@user)
		else
			flash[:warning] = "Invalid entries"
			render 'edit'
		end
	end

	def transaction_status
		@user = User.find(params[:user_id])
		@tools = @user.tools
	end

private

		def user_params
			params.require(:user).permit(:username, :email, :password, :profile_pic, :password_confirmation)
		end

		def set_user
			@user = User.find(params[:id])
		end


		def require_same_user
			if current_user != @user
				flash[:danger] = "You cannot edit another user's information"
				redirect_to root_path
			end
		end

end
