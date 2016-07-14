require_relative "oystercard"

class Journey

  BALANCE_LIMIT = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  # attr_reader :balance
  attr_reader :entry_station, :journey

  card = Oystercard.new


  def initialize
    # @balance = 0
    @journey = {}
  end

  def touch_in(entry_station)
    # raise "insufficient funds" if balance < MIN_BALANCE
    fail if card.insufficient_funds
    @entry_station = entry_station
    journey[:entry_station] = entry_station
  end









end
