class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
		render :show #neu nhu ko goi render rails se tu dong goi den file trung ten voi phuong thuc
	end

	def	new
		@user = User.new
		render :new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			#Handle a successful save
			log_in @user
			flash[:message] = "Welcome"
			redirect_to @user
		else
			render :new
		end
	end

	private
	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end
end