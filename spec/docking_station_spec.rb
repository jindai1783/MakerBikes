require 'docking_station'


describe DockingStation do
	let(:station) {DockingStation.new(:capacity => 20)}
	let(:bike) {Bike.new}

	it 'should accept a bike' do		
		expect(station.bike_count).to eq 0
		station.dock(bike)
		expect(station.bike_count).to eq 1
	end

	it 'should release a bike' do		
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq 0
	end

	it 'should know when it is full' do		
		expect(station).not_to be_full
		20.times do 
			station.dock(bike)
		end
		expect(station).to be_full
	end

	it 'definitely should not accept a bike when full' do		
		station.fill_station 
		# fill_station station
		expect( lambda {station.dock(bike)} ).to raise_error(RuntimeError, 'Station is full')
	end
end