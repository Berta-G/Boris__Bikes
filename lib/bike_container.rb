module BikeContainer

	DEFAULT_CAPACITY = 10


	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value) # what exactly is going on here
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise "Station is full!" if full?
		bikes << bike
	end
	alias_method :dock_original, :dock

	def release(bike)
		bikes.delete(bike)
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject { |bike| bike.broken? }
	end


end