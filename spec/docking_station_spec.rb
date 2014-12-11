require 'docking_station'


describe DockingStation do
	let(:station) {DockingStation.new(:capacity => 155)}
	let(:broken_bike) {double :broken_bike, broken?: true}
	let(:working_bike){double :working_bike, broken?: false}
	let(:receiver_station) {double :station}

	it 'should allow setting default capacity on initialising' do
		expect(station.capacity).to eq(155)
	end

	it "can transfer bikes to another container" do
		station.dock broken_bike
		expect(receiver_station).to receive(:dock). with(broken_bike)
		station.transfer(station.broken_bikes, to: receiver_station)
	end

	it "will remove bikes once transfered" do
		station.dock broken_bike
		station.dock working_bike

		allow(receiver_station).to receive(:dock)
		
		station.transfer(station.broken_bikes, to: receiver_station)
		expect(station.bikes).to eq [working_bike]
	end

end

