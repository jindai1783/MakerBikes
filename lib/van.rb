# How will the van check out broken bikes if the available_bikes() method doesn't return broken bikes? 
# Extend the station to be able to interact with the van.

require 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity,DEFAULT_CAPACITY)
		self.bikes = []
	end

	def get_bikes_from(station)
		station.give_broken_bikes_to(self)
	end

	def get_broken_bikes_from(station)
		van.dock(station.bikes)
		station.release(station.bikes)
	end

	def eject_broken_bikes_to(garage)
		garage.dock(van.bikes)
		van.release(van.bikes)
	end
end