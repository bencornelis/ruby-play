require "rspec"
require "binary_trees"

describe "build_binary_tree" do
  it "builds a binary tree from a list of values" do
    values = [1,2,3,4,5,6,7,8]
    root = build_binary_tree(values)
    expect([
      root.val,
      root.left.val,
      root.right.val,
      root.left.left.val,
      root.left.right.val,
      root.right.left.val,
      root.right.right.val,
      root.left.left.left.val
    ]).to eq values
  end
end
