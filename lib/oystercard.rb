class Oystercard
LIMIT = 90
attr_reader :balance

def initialize
  @balance = 0
end

def top_up(money)
  raise "Exceeds limit: #{LIMIT}" if check_limit(money)
  @balance += money
end

def deduct(money)
  @balance -= money
end

private

def check_limit(money)
  (@balance + money)> LIMIT
end

end
