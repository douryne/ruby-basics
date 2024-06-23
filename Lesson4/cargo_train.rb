require_relative "train.rb"

class CargoTrain < Train
  def initialize(id)
    @id = id
    @type = :cargo
    @speed = 0
    @carriages = []
    @@instances << self
  end
end