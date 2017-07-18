require "rspec"
require "join_on"

describe Array do
  describe "#join_on" do
    let(:array) { [1, 2, 3, 4, 5, 6] }
    it "joins the array depending on neighboring elements" do
      expect(
        array.join_on { |x, y| (x + y) % 3 == 0 ? "*" : "&" }
      ).to eq "1*2&3&4*5&6"
    end
  end
end
