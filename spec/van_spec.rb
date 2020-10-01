require 'van'

describe Van do

    describe 'initialization' do
        it 'has a default capacity' do
            van = Van.new
            expect(van.capacity).to eq Van::DEFAULT_CAPACITY
        end
        it 'can be created with any capacity' do
            van = Van.new(5)
            expect(van.capacity).to eq 5
        end
    end

    describe '#collect_broken_bike' do
        let(:bike) { Bike.new }
        it 'collects broken bikes' do
            allow(bike).to receive(:broken?).and_return(true)
            subject.collect_broken_bike(bike)
            expect(subject.bikes.length).to eq 1
        end
        it 'raises an error if the bike is working' do
            allow(bike).to receive(:broken?).and_return(false)
            expect { subject.collect_broken_bike(bike) }.to raise_error('bike is working')
        end 
        it 'raises an error if full' do
            subject.capacity.times { subject.collect_broken_bike double :bike, broken?: true }
            expect { subject.collect_broken_bike double(:bike, broken?: true) }.to raise_error('van full')
        end
    end
end