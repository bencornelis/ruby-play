# Given a nonnegative integer, return a hash whose keys are all the odd nonnegative integers up to it
# and each key's value is an array containing all the even non negative integers up to it.
#
# Examples:
# staircase 1  # => {1 => []}
# staircase 2  # => {1 => []}
# staircase 3  # => {1 => [], 3 => [2]}
# staircase 4  # => {1 => [], 3 => [2]}
# staircase 5  # => {1 => [], 3 => [2], 5 =>[2, 4]}

def staircase(n)
  [*1..n].select(&:odd?).inject({}) do |memo, k|
    memo[k] = [*1..k].select(&:even?)
    memo
  end
end

# Write a method, reverse_map, which invokes a block on each of the elements in reverse order,
# and returns an array of their results.
#
# reverse_map(1, 2, 3) { |i| i * 2 }      # => [6, 4, 2]

def reverse_map(*nums, &block)
  nums.reverse.map(&block)
end

# Write a method that initializes an Array
# it receives one parameter, which is 5 by default, but can be overridden by the user
# The parameter determines the size of the Array to initialize
#
# If a block is submitted, use that block to initialize each index in the Array (pass it the current index)
#
# If a block is not submitted, initialize the Array to 100 times the array's index, as a String
#
# CONDITIONS:
#   Do not loop through the Array to initialize it, instead, use the block form

def array_init(size = 5, &block)
  block_given? ? Array.new(size, &block) : Array.new(size) { |i| (100*i).to_s }
end

# using inject
# def array_init(size = 5, &block)
#   (0...size).inject([]) do |memo, i|
#     [*memo, block_given? ? block.call(i) : (100*i).to_s]
#   end
# end

# For this problem, you will need to know how to use a linked list.
#
# A linked list is like a train, each car is connected to the car behind it. Then you just
# keep track of the engine, and you know where the whole train is. And you know when you reach
# the caboose because it's not got any more cars behind it.
#
# We'll implement our linked list with hash tables. So in a linked list, you keep track of the
# first hash in the list, usually called the head, and he points to the node after him.
# Similarly, the node after him, and every other node in the list point to the node after
# themselves, as well. Except the last node, which points to nil.
#
# head = {:data => 1, :next => nil}
# head = {:data => 2, :next => head}
# head # => {:data=>2, :next=>{:data=>1, :next=>nil}}
# head = {:data => 3, :next => head}
# head # => {:data=>3, :next=>{:data=>2, :next=>{:data=>1, :next=>nil}}}
#
# See? Each one just points to the next one after himself. Then you can say things like:
# head[:data]                 # => 3
# head[:next][:data]          # => 2
# head[:next][:next][:data]   # => 1
#
# ===========
#
# Now that we know what a linked list is, write a function named middle, which takes a linked list,
# and returns the data halfway down the list.

def middle(head)
  values = []
  while head
    values << head[:data]
    head = head[:next]
  end
  values[values.size/2]
end

# Print to stdout, each element in a hash based linked list.
# If you don't know what that is, go check out the previous problem.
#
# EXAMPLES:
# head = {:data => 1, :next => nil}
# print_list head                    # >> "1\n"
# head = {:data => 2, :next => head}
# print_list head                    # >> "2\n1\n"
# head = {:data => 3, :next => head}
# print_list head                    # >> "3\n2\n1\n"
# head = {:data => 4, :next => head}
# print_list head                    # >> "4\n3\n2\n1\n"
# head = {:data => 5, :next => head}
# print_list head                    # >> "5\n4\n3\n2\n1\n"
# head = {:data => 6, :next => head}
# print_list head                    # >> "6\n5\n4\n3\n2\n1\n"

def print_list(head)
  return unless head
  puts head[:data]
  print_list(head[:next])
end

# building the string first
# def print_list(head)
#   def to_s(head)
#     return "" unless head
#     "#{head[:data]}\n#{to_s(head[:next])}"
#   end
#   puts to_s(head)
# end

# Print to stdout, each element in a hash based linked list, in reverse.
# If you don't know what that is, go check out the previous problem.
#
# EXAMPLES:
# head = {:data => 1, :next => nil}
# head = {:data => 2, :next => head}
#
# print_list_in_reverse head   # >> "1\n2\n"

def print_list_in_reverse(head)
  def to_s(head)
    return "" unless head
    "#{to_s(head[:next])}#{head[:data]}\n"
  end
  puts to_s(head)
end

# Write a method that takes a string and returns a hash
# whose keys are all the downcased words in the string,
# and values are the number of times these words were seen.
#
# No punctuation will appear in the strings.
#
# Example:
# word_count "The dog and the cat" # => {"the" => 2, "dog" => 1, "and" => 1, "cat" => 1}

def word_count(str)
  str.split(" ").inject(Hash.new(0)) do |memo, word|
    memo[word.downcase] += 1
    memo
  end
end

# Write first_pos, a method which takes a string and returns a hash
# whose keys are all the words in the string, and values are the
# earliest position they were seen in the string.
#
# There will be no punctuation in the strings.
#
# first_pos "The dog and the cat and the cow" # => {"The" => 0, "dog" => 1, "and" => 2, "the" => 3, "cat" => 4, "cow" => 7}

def first_pos(str)
  str.split(" ").each_with_index.inject({}) do |memo, (word, idx)|
    memo[word] = idx unless memo[word]
    memo
  end
end

# Write a method, spiral_access, that takes a 2d square array (an array of arrays)
# and a block, and calls the block for each of the elements, in spiral order.
#
# HINT: This method is probably best solved recursively
#
# Example:
# two_d = [
#   [ 1,  2,  3,  4, 5],
#   [16, 17, 18, 19, 6],
#   [15, 24, 25, 20, 7],
#   [14, 23, 22, 21, 8],
#   [13, 12, 11, 10, 9],
# ]
# order = []
# spiral_access two_d do |i|
#   order << i
# end
# order # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]

class Array
  def interior
    self[1..-2]
  end
end

class Square
  def initialize(two_d)
    @two_d = two_d
  end

  def spiral_access(&block)
    return unless any?
    outer_spiral.each(&block)
    inner_square.spiral_access(&block)
  end

  def outer_spiral
    if one_by_one?
      top
    else
      [*top, *right.interior, *bottom.reverse, *left.reverse.interior]
    end
  end

  def inner_square
    Square.new(two_d.map(&:interior).transpose.map(&:interior).transpose)
  end

  def any?
    two_d.any?
  end

  private

  attr_reader :two_d

  def one_by_one?
    two_d.size == 1
  end

  def top
    two_d.first
  end

  def bottom
    two_d.last
  end

  def right
    two_d.transpose.last
  end

  def left
    two_d.transpose.first
  end
end

def spiral_access(two_d, &block)
  Square.new(two_d).spiral_access(&block)
end
