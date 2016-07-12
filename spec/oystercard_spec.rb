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



end
