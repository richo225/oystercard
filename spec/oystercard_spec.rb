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

  end

  context 'Touch functionality in/out' do

    it 'should not be in journey when initiated' do
      expect(subject).not_to be_in_journey
    end

    it 'should set card to in journey when touched in' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it 'should set card to NOT be in journey when touched out' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

    it "should raise error on touch_in if minimum balance is not available" do
      expect{ subject.touch_in(station) }.to raise_error("insufficient funds")
    end

    it "should deduct minimum fare" do
      expect{ subject.touch_out }.to change{ subject.balance }.by (-Oystercard::MIN_FARE)
    end

    let(:station){ double(:station) }
    it "should remember the entry station while touching in" do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end

    it "resets entry station at touch_out" do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.entry_station).to eq nil

    end

end
