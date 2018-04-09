module ApplicationHelper
	def full_title (page_title = "")
		base_title = "Ruby on Rails Sample App"
		# if page_title.blank?
		# 	#return base_title
		# 	base_title
		# else
		# 	#return page_title + " | " + base_title
		# 	page_title + " | " + base_title
		# end
		page_title.blank? ? base_title : page_title + " | " + base_title
	end
end