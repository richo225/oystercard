require 'oystercard'


describe Oystercard do

let(:entry_station) {double(:station)}
let(:exit_station) {double(:station)}

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
      subject.touch_in(entry_station)
    end
    it "changes in_journey to true" do
      expect(subject.in_journey?).to eq true
    end
  end

  describe "touch in error" do
    it "raises error when insufficient balance" do
      expect{subject.touch_in(entry_station)}.to raise_error("Insufficient balance")
    end
  end

    describe "#touch out" do
      before (:each) do
        subject.top_up(10)
        subject.touch_in(entry_station)
      end
      it "turns in_journey to false when touching out" do
        subject.touch_out(exit_station)
        expect(subject.in_journey?).to eq false
      end

      it "reduces balance by minimum fare when touch_out" do
        expect{subject.touch_out(exit_station)}.to change{subject.balance}.by( -Oystercard::MINIMUM_FARE)
      end

      it "changes journey to nil" do
        subject.touch_out(exit_station)
        expect(subject.journey).to eq nil
      end
    end

    describe "#initialize journeys" do
      it "returns empty journey list" do
        expect(subject.journeys).to be_empty
      end
    end

    describe "#journeys" do
      it "contains a journey after touching_in and_out" do
        subject.top_up(10)
        subject.touch_in(entry_station)
        subject.touch_out(exit_station)
        expect(subject.journeys).to include(:entry_station => entry_station, :exit_station => exit_station)
      end
    end
end
