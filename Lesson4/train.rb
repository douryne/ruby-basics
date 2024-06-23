require_relative "station.rb"
require_relative "route.rb"

class Train
  @@instances = []

  def self.instances
    @@instances
  end

  attr_reader :speed, :carriages, :type, :current_station, :route, :id

  def increase_speed(speed)
    self.speed += speed if speed > 0
  end

  def stop_train
    self.speed = 0
  end

  def attach_the_carriage(carriage)
    self.carriages << carriage if self.speed == 0 && carriage.type == self.type
  end

  def unattach_the_carriage(carriage)
    self.carriages.delete(carriage) if self.speed == 0 && self.carriages.length > 0 && carriage.type == self.type
  end

  def set_route(route)
    self.route = route
    self.current_station = self.route.first_station
    self.current_station.accept_train(self)
  end

  def move_forward
    if !next_station.nil?
      self.current_station.send_train(self)
      self.current_station = next_station
      self.current_station.accept_train(self)
    end
  end

  def move_backwards
    if !previous_station.nil?
      self.current_station.send_train(self)
      self.current_station = previous_station
      self.current_station.accept_train(self)
    end
  end

  def next_station
    return self.current_station if self.current_station == self.route.last_station
    index = stations_list.index(self.current_station)
    return stations_list[index + 1]
  end

  def previous_station
    return self.current_station if self.current_station == self.route.first_station
    index = stations_list.index(self.current_station)
    return stations_list[index - 1]
  end

  protected
  attr_writer :speed, :carriages, :route, :current_station

  def stations_list
    return [] if self.route.nil?
    return self.route.get_all_stations
  end
end