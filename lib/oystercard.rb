class Oystercard

attr_accessor :balance, :in_journey, :entry_station
LIMIT = 90
MINIMUM_FARE = 1

def initialize
  @balance = 0
  @in_journey = false
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
  self.in_journey = true
  @entry_station = station
end

def touch_out
  deduct(MINIMUM_FARE)
  self.in_journey = false
  self.entry_station = nil
end

private

def check_limit(money)
  (balance + money)> LIMIT
end

def deduct(money)
  self.balance -= money
end

end
