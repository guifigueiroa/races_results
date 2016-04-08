class Event
  include Mongoid::Document
  field :o, as: :order, type: Integer
  field :n, as: :name, type: String
  field :d, as: :distance, type: Float
  field :u, as: :units, type: String
  
  embedded_in :parent, polymorphic: true, touch: true
  
  validates :order, :name, presence: true
  
  def meters
    case units
      when "miles"
        distance * 1609.344
      when "yards"
        distance * 0.9144
      when "kilometers"
        distance * 1000
      when "meters"
        distance
    end
  end
  
  def miles
    case units
      when "meters"
        distance * 0.000621371
      when "yards"
        distance * 0.000568182
      when "kilometers"
        distance * 0.621371
      when "miles"
        distance
    end
  end
end
