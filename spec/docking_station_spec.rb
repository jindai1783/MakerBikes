require 'docking_station'


describe DockingStation do
	let(:station) {DockingStation.new(:capacity => 20)}
	let(:broken_bike) {double :broken_bike, broken?: true}
	let(:working_bike){double :working_bike, broken?: false}
	# let(:bike) {double: working_bike, broken?: false}

	it 'should accept a bike' do		
		expect(station.bike_count).to eq 0
		station.dock(working_bike)
		expect(station.bike_count).to eq 1
	end

	it 'should release a bike' do		
		station.dock(working_bike)
		station.release(working_bike)
		expect(station.bike_count).to eq 0
	end

	it 'should know when it is full' do		
		expect(station).not_to be_full
		fill_station
		expect(station).to be_full
	end

	it 'definitely should not accept a bike when full' do		
		fill_station 
		expect{station.dock(working_bike)}.to raise_error(RuntimeError, 'Station is full')
	end

	it 'definitely should provide the list of available bikes' do
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq([working_bike])
	end

	def fill_station
		station.capacity.times {station.dock(working_bike)} 
	end
end


# # Lesson
# let(:bike) {double: working_bike, broken?: false}

# it "can accept bikes" do
# 	allow(bike).to receive(:break!)
# 	station.dock(bike)
# 	expect(station.bikes).to eq [bike]
# end

# it 'can know all the working bikes' do
# 	allow(bike).to receive(:break!)
# 	expect(station.working_bikes).to eq [bike]
# end

# it 'can break a bike onces it is docked' do
# 	expect(bike).to receive(:break!) #until test completely end
# 	station.dock(bike)
# end