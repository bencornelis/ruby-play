# find the max in an array
nums = [1,2,4,3,5,7,3,2]
nums.inject do |max, num|
  num > max ? num : max
end
# => 7

# find the position of the max in an array
nums.each_with_index.inject(0) do |max_idx, (num, idx)|
  num > nums[max_idx] ? idx : max_idx
end
# => 5

# build a hash from array of key-value pairs
pairs = [["a", 1], ["b", 2], ["c", 3]]
pairs.inject({}) do |h, (k, v)|
  h[k] = v
  h
end

# using each_with_object
pairs.each_with_object({}) { |(k, v), h| h[k] = v }

# get all even integers in array as string
# using select and map
nums = [1, 2, 3, 4, 5, 6]
nums.select(&:even?).map(&:to_s)
# using inject
nums.inject([]) do |memo, num|
  memo << num.to_s if num.even?
  memo
end

# Write code that splits a given array of integers into two arrays;
# the first containing odd numbers and second containing even numbers
nums = [1, 2, 3, 4, 5, 6]
nums.inject({even:[], odd:[]}) do |h, num|
  h[num.even? ? :even : :odd] << num
  h
end

# using each_with_object
nums.each_with_object({even:[], odd:[]}) do |num, h|
  h[num.even? ? :even : :odd] << num
end

# implement some Enumerable methods using inject instead of each
module MyEnumerable
  def inject(init, &block)
    raise "Implement me in your class."
  end

  def map(&block)
    inject([]) { |memo, elt| memo << block.call(elt) }
  end

  def select(&block)
    inject([]) { |memo, elt| block.call(elt) ? memo << elt : memo }
  end

  def each(&block)
    inject([]) do |memo, elt|
      block.call(elt)
      memo << elt
    end
  end

  def take_while(&block)
    inject([]) do |memo, elt|
      return memo unless block.call(elt)
      memo << elt
    end
  end

  def any?(&block)
    map(&block).inject { |memo, elt| memo || elt }
  end

  def all?(&block)
    map(&block).inject { |memo, elt| memo && elt }
  end

  def none?(&block)
    map(&block).inject(true) { |memo, elt| memo && !elt }
  end
end

class Numbers
  include MyEnumerable
  def initialize(nums)
    @nums = nums
  end

  def inject(init, &block)
    @nums.inject(init, &block)
  end
end
