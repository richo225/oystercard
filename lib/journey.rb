require_relative "oystercard"

class Journey

attr_reader :entry_station, :exit_station

  PENALTY_FARE = 6

  def initialize(entry_station: nil)
    @entry_station = entry_station
    @complete = false

  end

  def complete?
    @complete
  end

  def fare
    if entry_station && exit_station != nil
      Oystercard::MIN_FARE
    else
      PENALTY_FARE
    end
  end

  def finish(exit_station)
    @exit_station = exit_station
    @complete = true
    self
  end

end
