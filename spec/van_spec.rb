
require 'van'
require 'docking_station'

describe Van do
	let(:van) {Van.new(:capacity => 20)}
	let(:station){DockingStation.new(:capacity => 100)}
	# let(:station_a_cow) {double :station_a_cow}
	let(:broken_bike) {double :broken_bike, broken?: true}
	

	it "can transfer bikes to a van" do

		allow(broken_bike).to receive(:dock)
		allow(station).to receive(:dock). with(broken_bike)
		
		station.dock broken_bike
		
		van.get_broken_bikes_from(station)
		expect(station.bike_count).to eq 0
	end

end