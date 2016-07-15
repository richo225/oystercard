require "journey_log"

describe JourneyLog do


  #let(:station){ double(:station) }
  journey = Journey.new(entry_station: "station")
  subject {described_class.new(journey_class: journey)}

  # it "initializes journey_log with a journey class" do
  #   expect(subject.journey_class).to eq journey
  # end


  #journey2 = Jorney.new(entry_station: station)

  it "starts a journey with an entry station" do
  subject.start("station")
    expect(subject.new_journey).to eq journey
  end




end
