require 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity,DEFAULT_CAPACITY)
	end

	def empty?
		return true if bike_count == 0
		else return false
	end

	def receive_fixed_bikes_from(van)
		station.dock(van.bikes)
		van.release_broken_bikes(van.bikes)
	end

end