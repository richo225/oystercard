require "station"

describe Station do

  subject {described_class.new(name: "first st.", zone: 1)}

  it "station has a name" do
    name = "first st."
    expect(subject.name).to eq name
  end

  it "station has a zone" do
    zone = 1
    expect(subject.zone).to eq zone
  end

end
