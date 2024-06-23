require_relative "carriage.rb"

class CargoCarriage < Carriage
  def initialize
    @type = :carge
    @@instances << self
  end
end