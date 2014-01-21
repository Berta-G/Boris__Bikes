require_relative '../lib/bike_container'

class ContainerHolder 

include BikeContainer

def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
end
end

def fill_station(station)
		20.times { station.dock(Bike.new) }
end

describe BikeContainer do 
	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new(:capacity => 20) }

	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
				holder.dock(bike)
				holder.release(bike)
				expect(holder.bike_count).to eq(0)
	end

	it "should know it's full" do 
		expect(holder).not_to be_full
		fill_station(holder)
		expect(holder).to be_full
	end

	it "should return the list of available bikes" do
		broken_bike = Bike.new
		broken_bike.break
		holder.dock(bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([bike])
	end

	it "should raise an error if the bike is not there" do
		expect { holder.release(bike) }.to raise_error(RuntimeError)
	end

	it "should raise an error if the argument is empty" do 
		expect { holder.release([])}.to raise_error(RuntimeError)
	end

	it "should know if it's empty" do 
		expect(holder).to be_empty
	end

	it "should be able to list broken bikes" do 
		bike.break
		holder.dock(bike)
		expect(holder.broken_bikes).to eq([bike])
	end
end








