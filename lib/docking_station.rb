require_relative 'bike_container'

class DockingStation
	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity) # by self this means the method inside bike_container?
	end
end