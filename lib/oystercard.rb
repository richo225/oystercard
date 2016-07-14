require_relative 'journey'

class Oystercard

attr_accessor :balance, :in_journey, :journey_history

LIMIT = 90
MINIMUM_FARE = 1

def initialize
  @balance = 0
  @in_journey = false
  @journey_history = []
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
  @new_journey = Journey.new(station)
end

def touch_out(station)
  @new_journey.finish(station)
  deduct(MINIMUM_FARE)
  @journey_history << @new_journey.current_journey
end

private

def check_limit(money)
  (balance + money)> LIMIT
end

def deduct(money)
  self.balance -= money
end

end
