class UsersController < ApplicationController
	def show
		# first check if this user is equal to the user being shown,
		# else return to the root
		if current_user.id == params[:id].to_i
			@user = User.find(params[:id])
		else
			flash[:error] = 'Not the correct user '
			redirect_to root_path
		end
	end
	
	def new
		@user = User.new
	end

	def index
		redirect_to root_path
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to Chunks!"
			redirect_to @user
		else
			render 'new'
		end
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password,
											:password_confirmation)
		end
end