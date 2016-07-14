require "journey_log"

describe JourneyLog do

  subject {described_class.new(journey_class: Journey.new)}

  let(:entry_station) { double(:station) }

  it "starts a journey with an entry station" do
    expect(subject.start(entry_station)).to eq entry_station
  end





end
