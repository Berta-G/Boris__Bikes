require_relative '../lib/docking_station'

describe DockingStation do 

	let(:bike) { Bike.new }
	let(:station) { DockingStation.new(:capacity => 20) }
end