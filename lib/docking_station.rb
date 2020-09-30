require_relative 'bike'

class DockingStation
    attr_reader :bike
    def release_bike
        raise 'no bikes available' unless @bike 
        @bike
    end 
    def dock(bike)
        raise 'station full' if @bike
        @bike = bike
    end
end 