class SiteController < ApplicationController

	def home
		@link = Link.new
		@link.visits = 0
		@link.last_visited = Date.today
	end


end
