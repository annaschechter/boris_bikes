
module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes 
  	@bikes ||= []
  end

  def capacity
    if @capacity.is_a? Integer
      if @capacity >= 0
        @capacity
      else
        @capacity = DEFAULT_CAPACITY
      end
    else
      @capacity = DEFAULT_CAPACITY
    end
  end 

  def capacity=(value) 
  	@capacity = value
  end

# although we could get rid of bike_count we should keep it because it makes our code shorter and hence more readable
  def bike_count
    bikes.count
  end

  def dock(bike)
  	raise "Station is full" if full?
    raise "This is not a bike" if bike.class != Bike
  	bikes << bike
  end
 
  def release
    raise "The holder is empty!" if available_bikes.empty?
    bikes.delete(available_bikes.pop)
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
  	bikes.reject {|bike| bike.broken? }
  end

  def broken_bikes
    bikes.select {|bike| bike.broken? }
  end

end