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
    let(:broken_bike) { double :bike, broken?: true }
    let(:docking_station) { DockingStation.new }
    it 'collects broken bikes' do
      docking_station.dock(broken_bike)
      subject.collect_broken_bike(broken_bike, docking_station)
      expect(subject.bikes.length).to eq 1
    end
    it 'raised an error if there are no bikes bikes' do
      expect { subject.collect_broken_bike(broken_bike, docking_station) }.to raise_error('no bikes available')
    end
    it 'raises an error if the bike is working' do
      allow(bike).to receive(:broken?).and_return(false)
      expect { subject.collect_broken_bike(bike, docking_station) }.to raise_error('bike is working')
    end
    it 'raises an error if full' do
      subject.capacity.times { docking_station.dock(broken_bike) }
      subject.capacity.times { subject.collect_broken_bike(broken_bike, docking_station) }
      docking_station.dock(broken_bike)
      expect { subject.collect_broken_bike(broken_bike, docking_station) }.to raise_error('van full')
    end
  end
end
