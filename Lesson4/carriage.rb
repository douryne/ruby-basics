class Carriage
  @@instances = []

  def self.instances
    @@instances
  end

  attr_reader :type
end