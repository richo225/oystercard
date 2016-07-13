require 'oystercard'

describe Oystercard do

let(:station) {double(:station)}

  describe '#balance' do
    it 'should check that a new card has a balance' do
      expect(subject).to respond_to(:balance)
    end

    it 'should have default value of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe "#top_up" do

    it "should add money to balance" do
      expect{subject.top_up(5)}.to change {subject.balance}.by 5
    end

    it "should throw an error, if balance is exceed limit" do
      limit = Oystercard::LIMIT
      expect { subject.top_up(limit+1) }.to raise_error "Exceeds limit: #{limit}"
    end
  end


  describe "#touch in " do
    before(:each) do
      subject.top_up(10)
      subject.touch_in(station)
    end
    it "changes in_journey to true" do
      expect(subject.in_journey).to eq true
    end

    it "remembers entry station when touching in" do
      expect(subject.entry_station).to eq station
    end
  end
  describe "touch in error" do
    it "raises error when insufficient balance" do
      expect{subject.touch_in(station)}.to raise_error("Insufficient balance")
    end
  end
    describe "#touch out" do
      before (:each) do
        subject.top_up(10)
        subject.touch_in(station)
      end
      it "turns in_journey to false when touching out" do
        subject.touch_out
        expect(subject.in_journey).to eq false
      end

      it "reduces balance by minimum fare when touch_out" do
        expect{subject.touch_out}.to change{subject.balance}.by( -Oystercard::MINIMUM_FARE)
      end

      it "changes entry_station to nil" do
        expect{subject.touch_out}.to change{subject.entry_station}.from(station).to(nil)
      end
    end



end
