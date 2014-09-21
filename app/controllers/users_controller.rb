class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def create
		@user = User.new(users_params)
		@user.save
		redirect_to user_path(@user)
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:notice] = "User deleted successfully."
		else
			flash[:alert] = "There was a problem deleting the user."
		end
		redirect_to users_path
	end

	def users_params
		params.require(:user).permit(:fullname, :email)
	end
end