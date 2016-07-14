require_relative 'journey'

class Oystercard

attr_accessor :balance, :journey_history

LIMIT = 90
MINIMUM_FARE = 1

def initialize
  @balance = 0
  @journey_history = []
  @new_journey = Journey.new
end

def top_up(money)
  raise "Exceeds limit: #{LIMIT}" if check_limit(money)
  @balance += money
end

def touch_in(station)
<<<<<<< HEAD
  #penalty if @new_journey.exists? 
  fail "Insufficient balance" if @balance < MINIMUM_FARE
  @new_journey = Journey.new(station)
=======
  if (@new_journey.current_journey == {}) or (@new_journey.complete?)
    fail "Insufficient balance" if @balance < MINIMUM_FARE
    @new_journey = Journey.new
    @new_journey.entrance(station)
  else
    deduct(@new_journey.touch_in_fare)
    fail "Insufficient balance" if @balance < MINIMUM_FARE
    @new_journey = Journey.new
    @new_journey.entrance(station)
  end
>>>>>>> b410f1b4dcd59f6666134f2eee3a8327a201e3a8
end

def touch_out(station)
  if @new_journey.complete?
    deduct(@new_journey.touch_out_fare)
  else
    deduct(@new_journey.touch_out_fare)
    @new_journey.finish(station)
    @journey_history << @new_journey.current_journey
  end
end

private

def check_limit(money)
  (balance + money)> LIMIT
end

def deduct(money)
  self.balance -= money
end

end
