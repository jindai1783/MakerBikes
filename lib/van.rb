# How will the van check out broken bikes if the available_bikes() method doesn't return broken bikes? 
# Extend the station to be able to interact with the van.

require 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity,DEFAULT_CAPACITY)
	end

	# Design the methods that the van needs to have to move broken bikes from a station to the garage and back 
	# once they are fixed). Implement them.
	def eject(*bike)
		#>>> check if the passed argument, called bike is indeed from class Bike
		#>>> check if the bike is in the bikes
		#>>> + check if the bike is broken, if it is : do not give it
		# if bike.class == Bike && bike != [] && !bike.broken?
		if (bike != [])
			bike.each { |my_bike| bikes.delete(my_bike) }
		end
	end
	# Write the Van class. How is it different from other classes? What extra methods will it have? 
	# A van would normally take several bikes in one go. How do we do it? How will it take into account the space available in the van. Write tests for all use cases.
	# receives a number of bikes, docks? each one, holds it?
	def receive(*vanbikes)
		vanbikes.each {|bike| dock(bike)}
	end

end