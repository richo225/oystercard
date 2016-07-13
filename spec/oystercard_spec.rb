require 'oystercard'

describe Oystercard do

  it 'returns the initial balance of 0' do
    expect(subject.balance).to eq 0
  end

  context "Modification's to balance" do
    before do
      subject.top_up(Oystercard::BALANCE_LIMIT)
    end

    it 'raise error if balance exceeds max amount' do
      max_balance = Oystercard::BALANCE_LIMIT
      expect{ subject.top_up(1) }.to raise_error("Exceeds max allowed amount of #{max_balance}")
    end

    it 'should deduct amount from balance' do
      expect{ subject.deduct(20) }.to change{ subject.balance }.by -20
    end
  end

  context 'Touch functionality in/out' do

    it 'should not be in journey when initiated' do
      expect(subject).not_to be_in_journey
    end

    it 'should set card to in journey when touched in' do
      subject.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'should set card to NOT be in journey when touched out' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

    it "should raise error on touch_in if minimum balance is not available" do

      expect{ subject.touch_in }.to raise_error("insufficient funds")
    end

end
