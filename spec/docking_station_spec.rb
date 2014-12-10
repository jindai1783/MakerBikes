require 'docking_station'


describe DockingStation do
	let(:station) {DockingStation.new(:capacity => 155)}
	#let(:broken_bike) {double :broken_bike, broken?: true}
	#let(:working_bike){double :working_bike, broken?: false}

	it 'should allow setting default capacity on initialising' do
		expect(station.capacity).to eq(155)
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