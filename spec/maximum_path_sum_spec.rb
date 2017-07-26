require "rspec"
require "maximum_path_sum"

describe "maximum_path_sum" do
  it "returns the maximum total from top to bottom of a triangle" do
    triangle = []
    path = File.expand_path(File.dirname(__FILE__)+"/fixtures/p067_triangle.txt")
    File.open(path, "r") do |f|
      f.each_line do |line|
        triangle << line.strip.split(" ").map(&:to_i)
      end
    end
    expect(maximum_path_sum(triangle)).to eq 7273
  end
end
