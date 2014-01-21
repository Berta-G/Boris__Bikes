require_relative '../lib/garage'

describe Garage do
	it "should be able to set capacity" do
		garage1 = Garage.new ({:capacity => 22})
		expect(garage1.capacity).to eq(22)
	end
end
