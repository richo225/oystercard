require "journey"

describe Journey do

  let(:entry_station) {double(:station)}
  let(:exit_station) {double(:station)}

  describe '#entry_station' do
    it "Stores entry_station in a hash" do
      journey = Journey.new
      journey.entrance(entry_station)
      expect(journey.current_journey).to include(:entry_station => entry_station)
    end
  end

  describe "#finish" do
    it "Store exit journey" do
      journey = Journey.new
      journey.finish(exit_station)
      expect(journey.current_journey).to include(:exit_station => exit_station)
    end
  end

  describe "#fare" do
    it "calculate minumum fare" do
      journey = Journey.new
      journey.entrance(entry_station)
      journey.finish(exit_station)
      expect(journey.fare).to eq 1
    end

    it "returns penalty fare if no exit_station" do
      journey = Journey.new(entry_station)
      expect(journey.fare).to eq 6


    it "returns penalty fare if no entry_station" do
      journey = Journey.new
      expect(journey.fare).to eq 6
    end
  end
end
