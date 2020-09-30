require 'docking_station'

describe DockingStation do
     
    describe 'initialization' do
        it 'has a default capacity' do
            docking_station = DockingStation.new
            expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
        end 
        it 'can be created with any capacity' do
            docking_station = DockingStation.new(25)
            expect(docking_station.capacity).to eq 25
        end 
    end 
    
    describe '#release_bike' do
        let(:bike) { Bike.new }
        it 'releases a bike' do
            subject.dock(bike)
            expect(subject.release_bike).to eq bike
        end 
        it 'raises an error if empty' do
            expect { subject.release_bike }.to raise_error('no bikes available')
        end 
    end 

    describe '#dock' do
        let(:bike) { Bike.new }
        it 'docks something' do
            subject.dock(bike)
            expect(subject.bikes.length).to eq 1
        end 
        it 'returns docked bikes' do
            expect(subject.dock(bike)).to eq subject.bikes
        end 
        it 'raises an error if full' do
            subject.capacity.times { subject.dock(Bike.new) }
            expect { subject.dock(Bike.new) }.to raise_error('station full')
        end 
    end 
end