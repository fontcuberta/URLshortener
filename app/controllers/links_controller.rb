class LinksController < ApplicationController

	def create
		@link = Link.new link_params

		if Link.where(url: @link.url).exists?
			@url = Link.find_by(url: @link.url).short_url
			@link = Link.find_by(url: @link.url)
			@link.update_visits
			render 'show'
		else
			@link.shorten_link
			@link.visits = 1
			@link.last_visited = Date.today
			if @link.save
				@url = @link.shorten_link
				render 'show'
			else
				@link.short_url
				redirect_to home_path
			end
		end
	end

	def last_visited
		@link = Link.order(last_visited: :desc)
	end

	def most_visited
		@link = Link.order(visits: :desc)
	end


#Private methods

	private
	def link_params
    	params.require(:link).permit(:url)
    end
end
