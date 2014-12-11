require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	let(:bike) {Bike.new}
	let(:holder) {ContainerHolder.new}
	let(:broken_bike) {double :broken_bike, broken?: true}
	let(:working_bike){double :working_bike, broken?: false}

	it 'should have some bikes' do
		holder.dock(bike)
		expect(holder.bikes).to eq [bike]
	end

	it 'should accept a bike' do
		expect(holder.bike_count).to eq(0)
		holder.dock(working_bike)
		expect(holder.bike_count).to eq(1)
	end

	it 'should release a bike' do		
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq 0
	end

	# it 'should eject one or more bikes' do
	# 	holder.dock(bike)
	# 	holder.eject(bike)
	# 	expect(holder.bike_count).to eq 0
	# end

	# it 'should not eject a broken bike' do		
	# 	#please actually implement this !!
	# 	holder.dock(bike)
	# 	bike.break!
	# 	holder.eject(bike)
	# 	#I docked it => bike_count=1; tried to release + fail =>
	# 	expect(holder.bike_count).to eq 1
	# end

	# it 'should not release a bike if I did not mention a bike' do
	# 	#please actually implement this !!
	# 	holder.dock(bike)
	# 	holder.release()
	# 	expect(holder.bike_count).to eq 1
	# end

	it 'should know when it is full' do		
		expect(holder).not_to be_full
		fill_holder
		expect(holder).to be_full
	end

	it 'definitely should not accept a bike when full' do		
		fill_holder 
		expect{holder.dock(working_bike)}.to raise_error(RuntimeError, 'Station is full')
	end

	it 'definitely should provide the list of available bikes' do
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	def fill_holder
		holder.capacity.times {holder.dock(working_bike)} 
	end
end