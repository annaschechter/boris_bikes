require_relative 'bike_container'
require_relative 'van'
require_relative 'bike'

include BikeContainer

class Garage

	def initialize(options = {})
  	  self.capacity = options.fetch(:capacity, capacity)
    end

    def accept_broken_bikes(van)
      raise "The garage is full!" if full?
      bikes << van.release_broken_bikes until van.broken_bikes == []
      bikes.each{|bike| bike.fix!}
    end

end