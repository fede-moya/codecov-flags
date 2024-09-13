require "fish"

RSpec.describe Fish do
  describe "#eyes" do
    it "eyes test" do
      expect(Fish.new("robert").eyes("2")).to eq("this fish has 2 eyes")
    end
  end
end
