require "rspec"
require "binary_search"

describe "binary_search" do
  it "is the index of the value if the value is in the array" do
    expect(binary_search([1,2,3,4,5,6,7], 5)).to eq 4
  end

  it "is nil if the value is not in the array" do
    expect(binary_search([1,2,3,4,5,6,7], 8)).to be_nil
  end

  it "works for arrays with both an even and odd number of elements" do
    expect(binary_search([1,2,3,5,6,7], 1)).to eq 0
  end
end
