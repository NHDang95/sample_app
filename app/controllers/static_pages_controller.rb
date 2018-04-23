class StaticPagesController < ApplicationController
	def home
    if logged_in?
      @micropost = current_user.microposts.build
      @show_feed = current_user.feed.paginate(page: params[:page])
    end
	end

	def help
	end

	def about
	end
end
