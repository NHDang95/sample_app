class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  #check if logged in
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please Log In"
        redirect_to login_url
      end
    end
end
