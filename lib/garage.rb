include BikeContainer

class Garage 
	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end
end

