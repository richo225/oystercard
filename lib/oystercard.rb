class Oystercard

  BALANCE_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Exceeds max allowed amount of #{BALANCE_LIMIT}" if balance_exceeds_limit?(amount)
    @balance += amount
  end

  private

  def balance_exceeds_limit?(amount)
    balance + amount > BALANCE_LIMIT
  end

end
