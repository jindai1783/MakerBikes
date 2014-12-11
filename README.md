Boris Bikes à la Makers
===========
###Jin & Sanda Pairing FTW!!!

#Classes

##Bike
Responsibility  | Collaborators
----------------|---------------------------
Break           | User
Be Fixed        | Garage

##Van
Responsibility  | Collaborators
----------------|---------------------------
Transfer        | Bike, Station, Garage
(Eject)         | Bike, Station, Garage
(Receive)       | Bike, Station, Garage


##Garage
Responsibility  | Collaborators
----------------|---------------------------
Transfer        | Bike, Station, Garage
Fix             | Bike
(Eject)         | Bike, Station, Garage
(Receive)       | Bike, Station, Garage

##Station
Responsibility  | Collaborators
----------------|---------------------------
Rent            | User
Dock            | User
Release         | Bike
Transfer        | Bike, Station, Garage
(Eject)         | Bike, Station, Garage
(Receive)       | Bike, Station, Garage

<!-- 
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
# end -->
