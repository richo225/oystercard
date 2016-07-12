class Oystercard

  BALANCE_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Exceeds max allowed amount of #{BALANCE_LIMIT}" if balance_exceeds_limit?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def balance_exceeds_limit?(amount)
    balance + amount > BALANCE_LIMIT
  end

end
