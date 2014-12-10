require 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity,DEFAULT_CAPACITY)
	end

	def accept(bike)
		bike.fix!
		dock(bike)
	end 

end