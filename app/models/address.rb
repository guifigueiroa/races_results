class Address
  attr_reader :city, :state, :location

  def initialize(city, state, location)
    @city = city
    @state = state
    @location = Point.new(location[0], location[1])
  end

  #creates a DB-form of the instance
  def mongoize
    {:city => @city, :state => @state, :loc => @location.mongoize}
  end

  #creates an instance of the class from the DB-form of the data
  def self.demongoize(object)
    case object
    when Hash then Address.new(object[:city], object[:state], object[:loc][:coordinates])
    else nil
    end
  end

  #takes in all forms of the object and produces a DB-friendly form
  def self.mongoize(object) 
    case object
    when Address then object.mongoize
    else object
    end
  end

  #used by criteria to convert object to DB-friendly form
  def self.evolve(object)
    case object
    when Address then object.mongoize
    else object
    end
  end
end
