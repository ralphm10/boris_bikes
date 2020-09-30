require 'docking_station'

describe DockingStation do
    
    describe '#release_bike' do
        it 'releases a bike' do
            bike = Bike.new
            subject.dock(bike)
            expect(subject.release_bike).to eq bike
        end 
        it 'raises an error if empty' do
            expect { subject.release_bike }.to raise_error('no bikes available')
        end 
    end 

    describe '#dock' do
        it 'docks something' do
            bike = Bike.new
            expect(subject.dock(bike)).to eq bike
        end 
        it 'returns docked bikes' do
            bike = Bike.new
            subject.dock(bike)
            expect(subject.bike).to eq bike
        end 
        it 'raises an error if full' do
            bike = Bike.new
            subject.dock(bike)
            expect { subject.dock(bike) }.to raise_error('station full')
        end 
    end 
end