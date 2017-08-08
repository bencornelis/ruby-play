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

# You are given an array strarr of strings and an integer k. Your task is to return the first longest string consisting of k consecutive strings taken in the array.

# Example: longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"

# n being the length of the string array, if n = 0 or k > n or k <= 0 return "".

def longest_consec(strarr, k)
  return "" if strarr == [] || k > strarr.size || k <= 0
  strarr.each_cons(k).inject("") do |longest, strs|
    str = strs.join
    str.length > longest.length ? str : longest
  end
end

# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.
def find_missing_letter(arr)
  arr.each_cons(2) do |l1, l2|
    return (l1.ord+1).chr if l2.ord != l1.ord + 1
  end
end

# def find_missing_letter(arr)
#   ([*arr.first..arr.last] - arr).first
# end

# sort string of weights first by digit sum, then by string order
# "56 65 74 100 99 68 86 180 90" ordered by numbers weights becomes: "100 180 90 56 65 74 68 86 99"

def order_weight(strng)
  strng.split(" ").sort_by do |s|
    wt = s.split("").map(&:to_i).reduce(:+)
    [wt, s]
  end.join(" ")
end

# The number 89 is the first integer with more than one digit that fulfills the property partially introduced in the title of this kata. What's the use of saying "Eureka"? Because this sum gives the same number.
#
# In effect: 89 = 8^1 + 9^2
#
# The next number in having this property is 135.
#
# See this property again: 135 = 1^1 + 3^2 + 5^3
#
# We need a function to collect these numbers, that may receive two integers a, b that defines the range [a, b] (inclusive) and outputs a list of the sorted numbers in the range that fulfills the property described above.

def digits(n)
  q, r = n.divmod(10)
  q == 0 ? [r] : [*digits(q), r]
end

def pow_sum(n)
  digits(n).each_with_index.inject(0) { |sum, (d, i)| sum + d**(i+1) }
end

def sum_dig_pow(a, b)
  [*a..b].select { |n| n == pow_sum(n) }
end

# The goal of this exercise is to convert a string to a new string where each character in the new string is '(' if that character appears only once in the original string, or ')' if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.
#
# Examples:
#
# "din" => "((("
#
# "recede" => "()()()"
#
# "Success" => ")())())"
#
# "(( @" => "))(("

def duplicate_encode(word)
  counts = word.chars.inject(Hash.new(0)) do |h, c|
    h[c.downcase] += 1
    h
  end
  word.gsub(/./) { |c| counts[c.downcase] > 1 ? ")" : "(" }
end

# Implement the function unique_in_order which takes as argument a sequence and returns a list of items without any elements with the same value next to each other and preserving the original order of elements.
#
# For example:
#
# unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
# unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
# unique_in_order([1,2,2,3,3])       == [1,2,3]

def unique_in_order(iterable)
  items = iterable.is_a?(Array) ? iterable : iterable.chars
  items.inject([]) do |memo, item|
    item == memo.last ? memo : [*memo, item]
  end
end

# just learned about "chunk"
# def unique_in_order(iterable)
#   (iterable.is_a?(Array) ? iterable : iterable.chars).chunk {|x| x}.map(&:first)
# end

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

def solution(number)
 (1...number).inject(0) { |sum, k| (k % 3 == 0 || k % 5 == 0) ? sum + k : sum }
end

# Complete the method/function so that it converts dash/underscore delimited words into camel casing. The first word within the output should be capitalized only if the original word was capitalized.
#
# Examples:
#
# returns "theStealthWarrior"
# to_camel_case("the-stealth-warrior")
#
# returns "TheStealthWarrior"
# to_camel_case("The_Stealth_Warrior")

def to_camel_case(str)
  head, *tail = str.split(/[-_]/)
  [head, *tail.map(&:capitalize)].join
end

# Find all unique permutations of a string

class String
  def intersperse(chr)
    (0..size).map { |i| "#{self[0...i]}#{chr}#{self[i..-1]}" }
  end
end

def permutations(string)
  return [string] if string.length == 1
  permutations(string[1..-1]).flat_map { |perm| perm.intersperse(string[0]) }.uniq
end

# Write a program that will calculate the number of trailing zeros in a factorial of a given number.
#
# http://mathworld.wolfram.com/Factorial.html
#
# N! = 1 * 2 * 3 * 4 ... N
#
# zeros(12) = 2 # 1 * 2 * 3 .. 12 = 479001600
# that has 2 trailing zeros 4790016(00)
# Be careful 1000! has length of 2568 digital numbers.

def zeros(n)
  (1..Math.log(n,5).to_i).inject(0) { |count, pow| count + n/(5**pow) }
end

# There is a secret string which is unknown to you.
# Given a collection of random triplets from the string, recover the original string.
# Example
# secret_1 = "whatisup"
# triplets_1 = [
#   ['t','u','p'],
#   ['w','h','i'],
#   ['t','s','u'],
#   ['a','t','s'],
#   ['h','a','p'],
#   ['t','i','s'],
#   ['w','h','s']
# ]

# first attempt
def secret?(perm, triplets)
  triplets.all? { |triplet| triplet == perm.select { |x| triplet.include?(x) } }
end

def recover_secret(triplets)
  chars = triplets.flatten.uniq
  chars.permutation.find { |perm| secret?(perm, triplets) }.join
end

# Create a simple calculator that given a string of operators (+ - * and /)
# and numbers separated by spaces returns the value of that expression
#
# Example:
#
# Calculator.new.evaluate("2 / 2 + 3 * 4 - 6") # => 7

class Calculator
  def evaluate(string)
    chrs = string.split(/\s/)
    [/[\*\/]/, /[+-]/].each { |ops| chrs = apply_ops(chrs, ops) }
    chrs.first
  end

  private
  def apply_ops(chrs, ops)
    chrs.each_with_object([]) do |y, rtn|
      if rtn.last =~ ops
        op, x = rtn.pop, rtn.pop
        x, y = x.to_i, y.to_i
        rtn << x.send(op, y)
      else
        rtn << y
      end
    end
  end
end
