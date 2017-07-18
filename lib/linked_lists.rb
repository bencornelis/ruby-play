# Definition for a linked list node.
Node = Struct.new(:val, :next)

# Remove all elements from a linked list of integers that have value val.
def remove_elements(head, val)
  return nil unless head
  head.next = remove_elements(head.next, val)
  head.val == val ? head.next : head
end

# Build a linked list from an array of values
def build_linked_list(vals)
  root = Node.new(vals[0])
  vals[1..-1].inject(root) { |node, val|
    node.next = Node.new(val) }
  root
end
