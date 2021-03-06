require "docking_station"

describe DockingStation do 

let(:station) { DockingStation.new(:capacity => 20) }
let(:van) {Van.new(:capacity => 20)}

def fill_container(holder)
	20.times {holder.dock(Bike.new)}
end

it "should allow setting default capacity on initialising" do
  expect(station.capacity).to eq(20)
end


it "should know when there are no bikes" do
	expect(station.bike_count).to eq(0)
	expect(station).to be_empty
end

it "should know when there are no bikes available" do
	expect(available_bikes).to be_empty
	expect(station).not_to have_rentals
end

it "should release broken bikes to the van" do
	expect(station).to be_empty
	broken_bike = Bike.new
	broken_bike.break!
	station.dock(broken_bike)
	station.release_broken_bikes
	expect(station).to be_empty
end

it "should accept working bikes from the van" do
	expect(station.bike_count).to eq(0)
	van.dock(Bike.new)
	van.dock(Bike.new)
	station.accept_fixed_bikes(van)
	expect(station.bike_count).to eq(2)
end

it "should not accept fixed bikes if full" do
	fill_container van
	fill_container station
	expect(lambda {station.accept_fixed_bikes(van)}).to raise_error(RuntimeError)
end

end