require 'garage'

describe Garage do
	let(:garage) {Garage.new(:capacity => 1000)}
	let(:broken_bike) {double :broken_bike, broken?: true}
	
	it "should accept a bike" do
		garage.dock(broken_bike)
		expect(garage.bike_count).to eq(1)
	end
end