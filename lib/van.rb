
class Van
	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def pick_up_broken(station)
		broken_bikes = station.broken_bikes
		raise "No broken bikes to pick up" if broken_bikes.empty?
		broken_bikes.each do |bike|  
		station.release(bike) 
		dock(bike)
		end
	end
end
