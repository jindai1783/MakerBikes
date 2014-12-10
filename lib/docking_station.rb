class DockingStation
	DEFAULT_CAPACITY = 10

	def initialize(options = {})
	# def initialize()
		@bikes = []
		@capacity = options.fetch(:capacity,DEFAULT_CAPACITY)
	end

	def bike_count
		@bikes.count
	end

	def dock(bike)
		raise "Station is full" if full?
		@bikes << bike
		# if full?
		# 	raise 'Station is full'
		# else
		# 	@bikes << bike
		# end
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def full?
		@bikes.count >= @capacity
	end

	def fill_station
	# def fill_station(station)
		20.times {self.dock(Bike.new)} 
		# 20.times {station.dock(Bike.new)} 
	end
end