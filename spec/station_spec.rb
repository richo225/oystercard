require 'station'
describe Station do
  describe "initialized station" do
    it "has name" do
      expect(subject.instance_variable_get(:@name)).to eq nil
    end
    it "has zone" do
      expect(subject.instance_variable_get(:@zone)).to eq nil
    end
  end
end
