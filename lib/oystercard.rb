class Oystercard
LIMIT = 90
attr_accessor :balance, :in_journey

def initialize
  @balance = 0
  @in_journey = false
end

def top_up(money)
  raise "Exceeds limit: #{LIMIT}" if check_limit(money)
  self.balance += money
end

def deduct(money)
  self.balance -= money
end

def in_journey?
  in_journey
end

def touch_in
  self.in_journey = true
end

def touch_out
  self.in_journey = false
end

private

def check_limit(money)
  (@balance + money)> LIMIT
end

end
