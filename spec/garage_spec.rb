require_relative '../lib/garage'

describe Garage do
	it "should be able to set capacity" do
		garage1 = Garage.new ({:capacity => 22})
		expect(garage1.capacity).to eq(22)
	end

	it "should be able to dock and fix a bike" do 
		bike = Bike.new
		garage = Garage.new
		bike.break
		garage.dock(bike)
		expect(garage.available_bikes).to eq([bike])
	end
end
