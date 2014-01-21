require_relative '../lib/van'


describe Van do

	let(:van) {Van.new}
	let(:station) {DockingStation.new}
	let(:working_bike) {Bike.new}
	let(:broken_bike) {Bike.new}

	it "Should pick up broken bikes from station" do
		station.dock(working_bike)
		broken_bike.break
		station.dock(broken_bike)
		expect(station.broken_bikes).to eq([broken_bike])
		expect(van.bike_count).to eq(0)
		van.pick_up_broken(station)
		expect(station.broken_bikes).to eq([])
		expect(van.bike_count).to eq(1)
    end

    it "should raise an error if there's no broken bikes at docking station" do
    	station.dock(working_bike)
    	expect { van.pick_up_broken(station) }.to raise_error(RuntimeError)
    end

end