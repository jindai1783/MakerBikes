# Makers Bikes

## Introduction

Collaborating with [Sanda], this is one of our first attempt to use OOD, and TDD. We have used CRC to aid our process of OOD.

[Sanda]: https://github.com/sandagolcea

## CRC

### Bike
Responsibility  | Collaborators
----------------|---------------------------
Break           | User
Be Fixed        | Garage

### Van
Responsibility  | Collaborators
----------------|---------------------------
Transfer        | Bike, Station, Garage
(Eject)         | Bike, Station, Garage
(Receive)       | Bike, Station, Garage

### Garage
Responsibility  | Collaborators
----------------|---------------------------
Transfer        | Bike, Station, Garage
Fix             | Bike
(Eject)         | Bike, Station, Garage
(Receive)       | Bike, Station, Garage

### Station
Responsibility  | Collaborators
----------------|---------------------------
Rent            | User
Dock            | User
Release         | Bike
Transfer        | Bike, Station, Garage
(Eject)         | Bike, Station, Garage
(Receive)       | Bike, Station, Garage

## Key Code

```ruby
// Creating a double with preset property
let(:bike) {double: working_bike, broken?: false}

// Allowing the double to receive certain methods
allow(bike).to receive(:break!)
```