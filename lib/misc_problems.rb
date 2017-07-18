# Given an integer, write a function to determine if it is a power of two.
def is_power_of_two(n)
  return false if n == 0
  until n == 1
    n, r = n.divmod(2)
    return false unless r == 0
  end
  true
end

# Determine whether an integer is a palindrome. Do this without extra space.
def is_palindrome(x)
  return false if x < 0
  x_rev, x_fwd = 0, x
  until x == 0
    x, d = x.divmod(10)
    x_rev *= 10
    x_rev += d
  end
  x_fwd == x_rev
end

# Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
# Do not allocate extra space for another array, you must do this in place with constant memory.
def remove_duplicates(nums)
  return 0 unless nums.any?
  i = 0
  (1...nums.size).each do |j|
    if nums[j] != nums[i]
      i += 1
      nums[i] = nums[j]
    end
  end
  i + 1
end

# Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
#
# The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
# Please note that your returned answers (both index1 and index2) are not zero-based.
#
# You may assume that each input would have exactly one solution and you may not use the same element twice.
def two_sum(numbers, target)
  i, j = 0, numbers.size - 1
  result = numbers[i] + numbers[j]
  while result != target
    result > target ? j -= 1 : i += 1
    result = numbers[i] + numbers[j]
  end
  [i+1, j+1]
end

# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
def two_sum(nums, target)
  lookup = {}
  nums.each_with_index do |num, j|
    i = lookup[target - num]
    return [i, j] if i
    lookup[num] = j
  end
end
