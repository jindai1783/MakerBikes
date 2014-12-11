# How will the van check out broken bikes if the available_bikes() method doesn't return broken bikes? 
# Extend the station to be able to interact with the van.

require 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity,DEFAULT_CAPACITY)
	end

end