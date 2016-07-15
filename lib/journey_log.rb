require_relative "journey"

class JourneyLog

  attr_reader :journey_class, :new_journey, :entry_station

  def initialize(journey_class: Journey.new)#(entry_station: station))
    @journey_class = journey_class
  end

  def start(station)
    @entry_station = station
  end
end
