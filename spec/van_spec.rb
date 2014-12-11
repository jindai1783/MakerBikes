
require 'van'
require 'docking_station'
require 'bike'

describe Van do
	let(:van) {Van.new(:capacity => 20)}
	let(:station){DockingStation.new(:capacity => 100)}
	# let(:station) {double :station}
	# let(:broken_bike) {double :broken_bike, broken?: true}
	let(:bike){Bike.new}

	it "can get bikes from a station" do

		# allow(broken_bike).to receive(:dock)
		# allow(station).to receive(:dock). with(broken_bike)
		# station.dock broken_bike
		bike.break!
		station.dock bike
		
		van.get_broken_bikes_from(station)
		
		# we took all the broken bikes from the station to the van
		# so there should be no broken bikes left at the station.
		expect(station.broken_bikes.count).to eq 0
	end

end