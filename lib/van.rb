require 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity,DEFAULT_CAPACITY)
		@bikes = []
	end

	def get_broken_bikes_from(station)
		self.dock(station.bikes)
		station.release_broken_bikes(station.bikes)
	end

	def eject_broken_bikes_to(garage)
		garage.accept(van.bikes)
		van.release(van.bikes)
	end
end