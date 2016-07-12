require 'oystercard'

describe Oystercard do

  describe '#balance' do
    it 'should check that a new card has a balance' do
      expect(subject).to respond_to(:balance)
    end

    it 'should have default value of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe "#top_up" do
    it {is_expected.to respond_to(:top_up).with(1).argument}

    it "should add money to balance" do
      expect{subject.top_up(5)}.to change {subject.balance}.to 5
    end
  end

end
