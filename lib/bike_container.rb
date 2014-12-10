module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end
		
	def capacity=(value)
		@capacity = value
	end

	def bike_count
		# bikes is referring to the METHOD which returns []
		bikes.count
	end

	def dock(bike)
		raise "Station is full" if full?
		bikes << bike
	end

	def release(bike)
		#>>> check if the passed argument, called bike is indeed from class Bike
		#>>> check if the bike is in the bikes
		#>>> + check if the bike is broken, if it is : do not give it!
		bikes.delete(bike)
	end

	def full?
		bikes.count >= capacity
	end

	def available_bikes
		# good bikes here:
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		# for van : broken bikes here, comme n get'em!!
		bikes.select{|bike| bike.broken?}
	end

	#>>> make a method empty?() to see if there are zero bikes
end