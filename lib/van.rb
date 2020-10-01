class Van

    DEFAULT_CAPACITY = 4
    attr_reader :capacity, :bikes
    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
        @bikes = []
    end 
    def collect_broken_bike(bike)
        @bikes.push(bike)
    end         
end