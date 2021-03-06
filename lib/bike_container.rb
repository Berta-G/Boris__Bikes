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
		raise "Station is full!" if full?
		bikes << bike
	end
	alias_method :dock_original, :dock

	def release(bike)
		 raise "Bike not found"  if bikes.delete(bike).nil?
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject { |bike| bike.broken? }
	end

	def broken_bikes
		bikes.select { |bike| bike.broken? }
	end

	def empty?
		bike_count == 0
	end

end




