class Route
  @@instances = []

  def self.instances
    @@instances
  end

  attr_reader :first_station, :last_station, :intermediate_stations

  def initialize(first_station, last_station, intermediate_stations = [])
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = intermediate_stations
    @@instances << self
  end

  def add_station(station)
    self.intermediate_stations << station
  end

  def remove_station(station)
    self.intermediate_stations.delete(station)
  end

  def get_all_stations
    [self.first_station, self.intermediate_stations, self.last_station].flatten(1)
  end

  private
  attr_writer :intermediate_stations
end