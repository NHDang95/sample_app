class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]
before_action :admin_user, only: :destroy
WillPaginate.per_page = 5

	def index
		@users = User.paginate(page: params[:page])
	end

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
			# log_in @user
			# flash[:message] = "Welcome"
			# redirect_to @user
			@user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
		else
			render :new
		end
	end

	def edit
    	@user = User.find(params[:id])
  	end

  	def update
  		@user = User.find(params[:id])
  		if @user.update_attributes(user_params)
  			#Handle a successful update
  			flash[:success] = "Update Successful!"
  			redirect_to @user
  		else
  			render 'edit'
  		end
  	end

  	def destroy
  		User.find(params[:id]).destroy
  		flash[:success] = "Delete Successful"
  		redirect_to users_url
  	end

	private
	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end

	#check if logged in
  	def logged_in_user
  		unless logged_in?
  			store_location
  			flash[:danger] = "Please Log In"
  			redirect_to login_url
  		end
  	end

  	#check if user is correct
  	def correct_user
  		@user = User.find_by(id: params[:id])
  		redirect_to root_url unless current_user?(@user)
  	end

  	def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
