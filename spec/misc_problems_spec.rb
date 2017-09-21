require "rspec"
require "misc_problems"

describe "#flatten" do
  it "flattens an array with arbitrary levels" do
    arr = [1,2,[3,4,5],[6,7,[8]]]

    expect(flatten(arr)).to eql [*1..8]
  end
end