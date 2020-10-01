require 'van'

describe Van do

    let(:bike) { Bike.new }

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
        it 'collects broken bikes' do
            subject.collect_broken_bike(Bike.new)
            expect(subject.bikes.length).to eq 1
        end 
    end    
end