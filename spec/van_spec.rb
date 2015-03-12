require 'van'
require 'docking_station'
require 'bike'

describe Van do
	let(:van) {Van.new(:capacity => 20)}
	let(:station){DockingStation.new(:capacity => 100)}
	let(:bike){Bike.new}

	it "can get bikes from a station" do
		bike.break!
		station.dock bike
		van.get_broken_bikes_from(station)
		expect(station.broken_bikes.count).to eq 0
	end

end