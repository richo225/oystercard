class Oystercard

attr_accessor :balance, :in_journey, :journey, :journeys
LIMIT = 90
MINIMUM_FARE = 1

def initialize
  @balance = 0
  @in_journey = false
  @journeys = []
end

def top_up(money)
  raise "Exceeds limit: #{LIMIT}" if check_limit(money)
  self.balance += money
end

def in_journey?
  !@journey.nil?
end

def touch_in(station)
  fail "Insufficient balance" if @balance < MINIMUM_FARE
  @journey = {}
  @journey[:entry_station] = station
end

def touch_out(station)
  deduct(MINIMUM_FARE)
  @journey[:exit_station] = station
  @journeys << @journey
  journey
  @journey = nil
end

private

def check_limit(money)
  (balance + money)> LIMIT
end

def deduct(money)
  self.balance -= money
end

end
