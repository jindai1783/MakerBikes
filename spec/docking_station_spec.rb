require 'docking_station'


describe DockingStation do
	let(:station) {DockingStation.new(:capacity => 155)}
	let(:broken_bike) {double :broken_bike, broken?: true}
	let(:working_bike){double :working_bike, broken?: false}
	let(:receiver_station) {double :station}
	let(:receiver_van) {double :van}

	it 'should allow setting default capacity on initialising' do
		expect(station.capacity).to eq(155)
	end

	it "can transfer bikes to another container" do
		allow(broken_bike).to receive(:dock)
		station.dock broken_bike
		expect(receiver_station).to receive(:dock). with(broken_bike)
		station.transfer(station.broken_bikes, to: receiver_station)
	end

	it "will remove bikes once transfered" do
		station.dock broken_bike
		station.dock working_bike

		allow(receiver_station).to receive(:dock)
		allow(working_bike).to receive(:dock)
		allow(broken_bike).to receive(:dock)
		
		station.transfer(station.broken_bikes, to: receiver_station)
		expect(station.bikes).to eq [working_bike]
	end

	it "will return true if empty" do
		expect(station.empty?).to eq true
	end

	it "can transfer bikes to a van" do
		allow(broken_bike).to receive(:dock)
		station.dock broken_bike

		expect(receiver_van).to receive(:dock). with(broken_bike)
		station.transfer(station.broken_bikes, to: receiver_van)
	end

end

