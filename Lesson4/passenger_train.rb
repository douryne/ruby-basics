require_relative "train.rb"

class PassengerTrain < Train
  def initialize(id)
    @id = id
    @speed = 0
    @carriages = []
    @type = :passenger
    @@instances << self
  end
end