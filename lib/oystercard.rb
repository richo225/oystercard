class Oystercard

attr_accessor :balance, :in_journey, :entry_station, :exit_station
LIMIT = 90
MINIMUM_FARE = 1

def initialize
  @balance = 0
  @in_journey = false
  @journey_list = []
end

def top_up(money)
  raise "Exceeds limit: #{LIMIT}" if check_limit(money)
  self.balance += money
end

def in_journey?
  !!entry_station
end

def touch_in(station)
  fail "Insufficient balance" if @balance < MINIMUM_FARE
  @entry_station = station
  @journey = {}
  @journey[:entry_station] = @entry_station
end

def touch_out(station)
  deduct(MINIMUM_FARE)
  @exit_station = station
  @journey[:exit_station] = @exit_station
  self.entry_station = nil
  @journey_list << @journey
  journey
end

def journeys
  @journey_list
end

def journey
  @journey
end

private

def check_limit(money)
  (balance + money)> LIMIT
end

def deduct(money)
  self.balance -= money
end

end
