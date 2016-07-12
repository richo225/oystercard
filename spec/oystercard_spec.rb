require 'oystercard'

describe Oystercard do

  describe '#balance' do
    it 'should checks that a new card has a balance' do
      expect(subject).to respond_to(:balance)
    end

    it 'should have default value of 0' do
      expect(subject.balance).to eq(0)
    end
  end

end
