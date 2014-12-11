require 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity,DEFAULT_CAPACITY)
		self.bikes ||= []
	end

	def accept(bike)
		bike.fix!
		dock(bike)
	end 

	def eject_fixed_bikes_to(van)
		van.dock(garage.bikes)
		garage.release(garage.bikes)
	end
end