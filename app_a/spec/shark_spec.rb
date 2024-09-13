require "shark"

RSpec.describe Shark do
  describe "#name" do
    it "is super excited about its name" do
      expect(Shark.new("Milo").name).to eq("Milo!!!")
    end
  end
end
