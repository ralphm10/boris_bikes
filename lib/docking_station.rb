require_relative 'bike'

class DockingStation
    DEFAULT_CAPACITY = 20
    attr_reader :bikes, :capacity

    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
        @bikes = []
    end

    def release_bike
        raise 'no bikes available' if empty?
        
        raise 'this bike is broken' if bikes[0].broken?

        bikes.pop
    end

    def dock(bike)
        raise 'station full' if full?
        bikes << bike
    end

    private 

    def full?
        bikes.length >= capacity
    end 
    def empty?
        bikes.empty?
    end 
end 