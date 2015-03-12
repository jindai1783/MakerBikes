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
		bikes.count
	end

	def dock(bike)
		raise "Station is full" if full?
		bikes << bike
	end

	def release(bike)
		if bikes.include?(bike) && bike.respond_to?('dock')
			bikes.delete(bike) 
		else 
			raise 'Cannot release'
		end
	end


	def release_broken_bikes(bike)
			if bike.is_a?(Array)
				bike.each {|b| bikes.delete(b)} 
			else
				bikes.delete(bike)
			end
	end


	def transfer bikes, to: station
		bikes.each { |bike| to.dock(bike); release(bike)}
	end

	def full?
		bikes.count >= capacity
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bikes.select{|bike| bike.broken?}
	end

	def give_broken_bikes_to(van)
		if van.class == Van
			broken_bikes.each do |bike| 
				release(bike)
				van.bikes << bike
			end
		else
			raise "Nice try!!"
		end
	end

end