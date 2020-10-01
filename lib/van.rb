require_relative 'bike'

class Van

    DEFAULT_CAPACITY = 4
    attr_reader :capacity, :bikes
    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
        @bikes = []
    end 
    def collect_broken_bike(bike)
        raise 'bike is working' unless bike.broken? 
        raise 'van full' if bikes.length >= capacity

        @bikes.push(bike)
    end         
end