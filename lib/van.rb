require_relative 'bike'
require_relative 'docking_station'

class Van

  DEFAULT_CAPACITY = 4
  attr_reader :capacity, :bikes
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def collect_broken_bike(bike, docking_station)
    raise 'bike is working' unless bike.broken?
    raise 'van full' if bikes.length >= capacity
    raise 'no bikes available' if docking_station.bikes.empty?

    docking_station.bikes.pop
    @bikes.push(bike)
  end
end
