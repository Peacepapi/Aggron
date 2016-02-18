class LoginsController < ApplicationController

	def new

	end

	def create
		user = User.find_by(email: params[:email])
		#email was found and password match
		if user && user.authenticate(params[:password])
			#stored id in browser cookies
			session[:user_id] = user.id
			flash[:success] = "Log in successful"
			redirect_to tools_path
		else
			flash.now[:danger] = "Invalid Logins Information!"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Logged out successfully"
		redirect_to root_path
	end

end
