require 'oystercard'

describe Oystercard do

  it 'returns the initial balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'increase balance by amount added' do
    amount = 20
    subject.top_up(amount)
    expect(subject.balance).to eq amount
  end

  it 'raise error if balance exceeds max amount' do
    max_balance = Oystercard::BALANCE_LIMIT
    subject.top_up(max_balance)
    expect{ subject.top_up(1) }.to raise_error("Exceeds max allowed amount of #{max_balance}")
  end

end
