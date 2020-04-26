
class Flight
  # attr_accessor :database_handle  ## Don't give access to :database_handle for future changes to code


  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end