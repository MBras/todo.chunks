class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update, :show]
	before_action :correct_user,   only: [:edit, :update, :show]

	def show
		@user = User.find(params[:id])
		@chunk = current_user.chunks.build if signed_in?
		@chunks = @user.chunks
	end
	
	def new
		@user = User.new
	end

	def edit
	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
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

		# Before filters
		def correct_user
			@user = User.find(params[:id])
			unless current_user?(@user)
				flash[:notice] = "Trying to access wrong user."
				redirect_to(root_path) 
			end
		end

end