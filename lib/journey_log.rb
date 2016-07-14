

class JourneyLog

  def initialize(journey_class: nil)
    @journey_class = journey_class

  end

  def start(entry_station)
    @entry_station = entry_station
  end

private

  def current_journey
    @current_journey
  end


end
