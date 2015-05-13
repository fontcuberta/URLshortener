class Link < ActiveRecord::Base
	validates :url, presence: true
	validates :url, uniqueness: true

	def shorten_link
		self.short_url = ('a'..'z').to_a.shuffle[0,4].join
	end

	def update_visits
		self.visits += 1
		last_visited = Date.today
		self.save
	end
end
