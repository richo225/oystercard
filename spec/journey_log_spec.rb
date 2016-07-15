require "journey_log"

describe JourneyLog do


  #let(:station){double :station}
  station = "entry_station"
  journey = Journey.new#(entry_station: station)
  subject {described_class.new(journey_class: journey)}

  describe "#initialize" do
    it "initializes journey_log with a journey class" do
      expect(subject.journey_class).to eq journey
    end

    it "initialises journey with a nil entry_station" do
      subject.journey_class
      expect(subject.entry_station).to eq nil
    end
  end

  describe "#start" do
    it "it adds an entry_station" do
      subject.start(station)
      expect(subject.entry_station).to eq station
    end
  end
end
