class Route
  attr_reader :first_station, :last_station

  def initialize(first_station, last_station, intermediate_stations)
    @first_station = first_station
    @last_station = last_station
    @intermediate_stations = intermediate_stations
  end

  def add_station(station, index)
    @intermediate_stations.insert(station, index)
  end

  def remove_station(station)
    @intermediate_stations.delete(station)
  end

  def get_all_stations
    [self.first_station, @intermediate_stations, self.last_station].flatten(1)
  end
end