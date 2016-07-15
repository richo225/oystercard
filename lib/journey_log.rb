require_relative "journey"

class JourneyLog

  attr_reader :journey_class, :new_journey

  def initialize(journey_class: Journey.new)
    @journey_class = journey_class
  end

  def start(station)

    @new_journey = Journey.new(entry_station: station)
  end



end
