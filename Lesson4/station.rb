class Station
  @@instances = []

  def self.instances
    @@instances
  end

  attr_reader :train_list

  def initialize(name)
    @name = name
    @train_list = Array.new
    @@instances << self
  end

  def accept_train(train)
    self.train_list << train
  end

  def train_list_by_type(train_type)
    self.train_list.select {|train| train.type == train_type}
  end

  def send_train(train)
    self.train_list.delete(train)
    puts self.train_list
  end

  private
  attr_writer :train_list
end