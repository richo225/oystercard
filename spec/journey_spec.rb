require 'journey'
require 'oystercard'
require 'station'

describe Journey do

let(:station) { double(:station)}


# it "should raise error on touch_in if minimum balance is not available" do
#     expect{ subject.touch_in(station) }.to raise_error("insufficient funds")
# end

let(:station){ double(:station) }
it "should remember the entry station while touching in" do
  oystercard = Oystercard.new
  oystercard.top_up(10)
  subject.touch_in(station)
  expect(subject.entry_station).to eq station
end






end
