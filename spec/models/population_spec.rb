require 'rails_helper'

RSpec.describe Population, type: :model do

  describe ".min_year" do
    it "should return earliest year available" do
      expect(Population.min_year).to eq(1900)
    end
  end

  describe ".get" do
    context "when receiving a year we know" do
      it "returns the correct population" do
        expect(Population.get(1900)).to eq(76212168)
        expect(Population.get(1990)).to eq(248709873)
      end
    end

    context "when receiving a year we don't know but it is within our known years" do
      it "returns a population based on a linear progression between our target year and the closest previously known year" do
        expect(Population.get(1902)).to eq(79415434)
        expect(Population.get(1908)).to eq(89025230)
      end
    end


    context "when receiving a year that is before our earliest known year" do
      it "returns zero" do
        expect(Population.get(1800)).to eq(0)
        expect(Population.get(0)).to eq(0)
        expect(Population.get(-1000)).to eq(0)
      end
    end

    context "when receiving a year that is after our latest known year" do
      it "returns the last known population" do
        expect(Population.get(2000)).to eq(248709873)
        expect(Population.get(200000)).to eq(248709873)
      end
    end
  end

end
