
require 'van'

describe Van do
	let(:van) {Van.new(:capacity => 20)}
	let(:sending_station) {double :sending_station}
	let(:broken_bike) {double :broken_bike, broken?: true}


	it "can transfer bikes to a van" do
		# allow(broken_bike).to receive(:dock)
		# sending_station.dock broken_bike

		# expect(sending_station).to receive(:transfer). with(broken_bike)
		# sending_station.transfer(sending_station.broken_bikes, to: van)
	end

end