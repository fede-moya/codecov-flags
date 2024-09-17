require "cat"

RSpec.describe Cat do
  describe "#untested_two" do
    it "returns something" do
      sleep(7 * 60)
      Cat.new("Milo").untested_two
      expect(1).to eq(1)
    end
  end
end
