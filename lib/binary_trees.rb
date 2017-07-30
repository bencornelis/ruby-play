# Definition for a binary tree node.
Node = Struct.new(:val, :left, :right)

# Given a binary tree, return the tilt of the whole tree.
#
# The tilt of a tree node is defined as the absolute difference
# between the sum of all left subtree node values
# and the sum of all right subtree node values. Null node has tilt 0.
#
# The tilt of the whole tree is defined as the sum of all nodes' tilt.

def find_tilt(root)
  def store_sums(root)
    return 0 unless root
    root.val = store_sums(root.left) + root.val + store_sums(root.right)
  end

  def sum_children_diffs(root)
    return 0 unless root
    right_val = root.right ? root.right.val : 0
    left_val = root.left ? root.left.val : 0
    sum_children_diffs(root.left) + (right_val - left_val).abs + sum_children_diffs(root.right)
  end

  store_sums(root)
  sum_children_diffs(root)
end

# Invert a binary tree
def invert_tree(root)
  return nil unless root
  root.left, root.right = invert_tree(root.right), invert_tree(root.left)
  root
end

# Given a binary tree, find its maximum depth.
#
# The maximum depth is the number of nodes along the longest path
# from the root node down to the farthest leaf node.
def max_depth(root)
  return 0 unless root
  [max_depth(root.left), max_depth(root.right)].max + 1
end

# Given a binary tree and a sum, determine if the tree has a root-to-leaf path
# such that adding up all the values along the path equals the given sum.
def has_path_sum(root, sum)
  level = [root]
  while level.any?
    node = level.pop
    left, right = node.left, node.right
    if left && right
      left.val  += node.val
      right.val += node.val
      level << left
      level << right
    elsif left
      left.val  += node.val
      level << left
    elsif right
      right.val += node.val
      level << right
    else
      return true if node.val == sum
    end
  end
  false
end

def build_binary_tree(values)
  nodes = values.map { |value| Node.new(value) }
  nodes.each_with_index do |node, idx|
    parent = nodes[(idx-1)/2]
    idx.odd? ? parent.left = node : parent.right = node
  end
  nodes.first
end
