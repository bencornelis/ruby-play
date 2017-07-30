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
