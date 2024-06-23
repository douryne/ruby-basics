require_relative "train.rb"
require_relative "cargo_train.rb"
require_relative "passenger_train.rb"
require_relative "carriage.rb"
require_relative "passenger_carriage.rb"
require_relative "cargo_carriage.rb"
require_relative "station.rb"
require_relative "route.rb"

def create
  puts "What do you want to create?"
    puts "1 - Create a Train"
    puts "2 - Create a Station"
    puts "3 - Create a Carriage"
    puts "4 - Create a Route"

  input = gets.to_i

  case input
  when 1
    create_train()
  when 2
    create_station()
  when 3
    create_carriage()
  when 4
    create_route()
  else
    puts "Wrong input"
  end
end

def create_train
  puts "What's your train number?"
  number = gets.to_i
  puts "What's your train type?"
  type = gets.chop

  case type
  when "passenger"
    PassengerTrain.new(number)
  when "cargo"
    CargoTrain.new(number)
  else
    puts "Wrong input"
  end
end

def create_station
  puts "What's the name of your station?"
  name = gets.chomp
  station = Station.new(name)
end

def create_carriage
  type = select_train_type()

  case type
  when "passenger"
    PassengerCarriage.new
  when "cargo"
    CargoCarriage.new
  else
    puts "Wrong input"
  end
end

def create_route
  puts "Select start and end stations"
  puts Station.instances

  start_index = gets.to_i - 1
  end_index = gets.to_i - 1

  start_station = Station.instances[start_index]
  end_station = Station.instances[end_index]

  if start_station == end_station
    puts "You've selected the same station twice"
  else
    Route.new(start_station, end_station)
  end
end

def manage_stations
  puts "1 - Add Station to Route"
  puts "2 - Remove station from Route"

  index = gets.to_i

  case index
  when 1
    add_station_to_route()
  when 2
    remove_station_from_route()
  else
    puts "Wrong input"
  end
end

def add_station_to_route
  puts "Select a route"
  puts Route.instances
  route_index = gets.to_i - 1
  selected_route = Route.instances[route_index]

  unless selected_route.nil?
    puts "Select a station"
    available_stations = Station.instances.select { |station| !selected_route.get_all_stations.include? station }
    puts available_stations
    station_index = gets.to_i - 1
    selected_station = available_stations[station_index]
    selected_route.add_station(selected_station)
  end
end

def remove_station_from_route
  puts "Select a route"
  puts Route.instances
  route_index = gets.to_i - 1
  selected_route = Route.instances[route_index]

  unless selected_route.nil?
    puts "Select a station"
    puts selected_route.intermediate_stations
    station_index = gets.to_i - 1
    selected_station = selected_route.intermediate_stations[station_index]
    selected_route.remove_station(selected_station)
  end
end

def manage_carriages
  puts "1 - Add Carriage to Train"
  puts "2 - Remove Carriage from Train"

  index = gets.to_i
  case index
  when 1
    add_carriage_to_train
  when 2
    remove_carriage_from_train
  else
    puts "Wrong input"
  end
end

def select_train_type
  puts "What's your train type?"
  return gets.chop
end

def add_carriage_to_train
  puts "Select a train"
  puts Train.instances
  train_index = gets.to_i - 1
  selected_train = Train.instances[train_index]

  unless selected_train.nil?
    puts "Select a carriage"
    available_carriages = Carriage.instances.select { |carriage| carriage.type == selected_train.type && !selected_train.carriages.include?(carriage) }
    puts available_carriages
    carriage_index = gets.to_i - 1
    selected_carriage = available_carriages[carriage_index]
    selected_train.attach_the_carriage(selected_carriage)
  end
end

def remove_carriage_from_train
  puts "Select a train"
  puts Train.instances
  train_index = gets.to_i - 1
  selected_train = Train.instances[train_index]

  unless selected_train.nil?
    puts "Select a carriage"
    puts selected_train.carriages
    carriage_index = gets.to_i - 1
    selected_carriage = selected_train.carriages[carriage_index]
    selected_train.unattach_the_carriage(selected_carriage)
  end
end

def set_route
  puts "Select a train"
  puts Train.instances
  train_index = gets.to_i - 1
  selected_train = Train.instances[train_index]

  unless selected_train.nil?
    puts "Select a route"
    puts Route.instances
    route_index = gets.to_i - 1
    selected_route = Route.instances[route_index]
    selected_train.set_route(selected_route)
  end
end

def show
  puts "1 - Show Stations list"
  puts "2 - Show Station Trains list"

  index = gets.to_i
  case index
  when 1
    show_stations
  when 2
    show_station_trains
  else
    puts "Wrong input"
  end
end

def show_stations
  puts Station.instances
end

def show_station_trains
  puts "Select Station"
  show_stations
  station_index = gets.to_i - 1
  selected_station = Station.instances[station_index]

  unless selected_station.nil?
    puts selected_station.train_list
  end
end

def move_train
  puts "Select Train"
  puts Train.instances
  train_index = gets.to_i - 1
  selected_train = Train.instances[train_index]

  unless selected_train.nil?
    puts "1 - move forward; 2 - move backwards"
    input = gets.to_i

    case input
    when 1
      selected_train.move_forward
    when 2
      selected_train.move_backwards
    else
      puts "Wrong input"
    end
  end
end

loop do
  puts "What do you want to do?"
    puts "1 - Create Train/Station/Route/Carriage"
    puts "2 - Manage Stations"
    puts "3 - Manage Carriages"
    puts "4 - Set Route to Train"
    puts "5 - Move train"
    puts "6 - Show list of stations or trains for routes"
    puts "7 - quit"
  input = gets.to_i

  case input
  when 1
    create()
  when 2
    manage_stations()
  when 3
    manage_carriages()
  when 4
    set_route()
  when 5
    move_train()
  when 6
    show()
  when 7
    break
  else
    puts "Wrong input"
  end
end