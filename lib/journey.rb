require_relative "oystercard"

class Journey

attr_reader :entry_station, :exit_station, :journey

  PENALTY_FARE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @complete = nil

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
    @journey = Journey.new
    @exit_station = exit_station
    @complete = true
  end








end
