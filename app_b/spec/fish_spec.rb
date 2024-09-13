require "fish"

RSpec.describe Fish do
  describe ".hi" do
    it "says hi" do
      expect(Fish.hi).to eq("hi")
    end
  end
end
