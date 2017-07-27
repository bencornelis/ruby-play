require "rspec"
require "ruby_kickstart"

describe "staircase" do
  it "meets the problem requirements" do
    expect(staircase 1).to eq({1 => []})
    expect(staircase 2).to eq({1 => []})
    expect(staircase 3).to eq({1 => [], 3 => [2]})
    expect(staircase 4).to eq({1 => [], 3 => [2]})
    expect(staircase 5).to eq({1 => [], 3 => [2], 5 =>[2, 4]})
  end
end

describe "reverse_map" do
  it "meets the problem requirements" do
    expect(reverse_map(1, 2, 3) { |i| i * 2 }).to eq [6, 4, 2]
  end
end
