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

# The goal is to implement a simple calculator which uses fluent syntax:
#
# Calc.new.one.plus.two              # Should return 3
# Calc.new.five.minus.six            # Should return -1
# Calc.new.seven.times.two           # Should return 14
# Calc.new.nine.divided_by.three     # Should return 3
# There are only four operations that are supported (plus, minus, times, divided_by) and 10 digits (zero, one, two, three, four, five, six, seven, eight, nine).
#
# Each calculation consists of one operation only.

class Calc
  %i{ zero one two three four five six seven eight nine }.each_with_index do |name, number|
    define_method(name) { op ? num.send(op, number) : Calc.new(number) }
  end

  { plus: :+, minus: :-, times: :*, divided_by: :/ }.each do |name, operation|
    define_method(name) { Calc.new(num, operation) }
  end

  attr_reader :num, :op
  def initialize(num = nil, op = nil)
    @num, @op = num, op
  end
end

# Sort the elements in a matrix and snake them down-up through the columns
# i.e turn this
# [[1, -1,  4, 1],
#  [7,-20, 12, 0],
#  [8, 10, -4,-3]]
#
# into this
# [[-20,  1, 1, 12],
#  [ -4,  0, 4, 10],
#  [ -3, -1, 7,  8]]

def up_down_col_sort(matrix)
  matrix
    .flatten.sort
    .each_slice(matrix.size)
    .map.with_index { |col, idx| idx.even? ? col : col.reverse }
    .transpose
end

# Create a function hollow_triangle(height) that returns a hollow triangle of the correct height.
# The height is passed through to the function and the function should return a list containing each line of the hollow triangle.
# hollow_triangle(6) will result in:
# _____#_____              1
# ____#_#____              2
# ___#___#___              3
# __#_____#__              4
# _#_______#_              5
# ###########              6 ---- Final Height

def hollow_triangle(n)
  return ['#'] if n == 1
  width = 1 + 2*(n-1)
  first_row, last_row  = '#'.center(width, '_'), '#'*width
  middle_rows =
    (1..width-4).step(2).each_with_object([]) { |fill_length, triangle|
      triangle << "##{'_'*fill_length}#".center(width, '_') }

  [first_row, *middle_rows, last_row]
end

# translate number of seconds to sentence
def format_duration(seconds)
  def pluralize(number, word)
    word = number == 1 ? word : "#{word}s"
    "#{number} #{word}"
  end

  def sentence(strs)
    return strs.first if strs.one?
    "#{strs[0...-1].join(', ')} and #{strs.last}"
  end

  return 'now' if seconds.zero?

  units = %w(year day hour minute second)
  secs  = [365*24*60*60, 24*60*60, 60*60, 60, 1]
  unit_phrases = units.zip(secs).each_with_object([]) do |(unit, sec_in_unit), strs|
    units_in_sec, seconds = seconds.divmod(sec_in_unit)
    strs << pluralize(units_in_sec, unit) unless units_in_sec.zero?
  end

  sentence(unit_phrases)
end
