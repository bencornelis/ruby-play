# 2-d array
def pascals_triangle(n)
  (n - 1).times.inject([[1]]) { |triangle|
    triangle << next_row(triangle) }
end

def next_row(triangle)
  [0, *triangle.last, 0].each_cons(2).map { |x, y| x + y }
end

# 1-d array
def pascal(n)
  sum_two = -> x, y { x + y }
  (1...n).inject([1]) { |tr, k|
    tr + [0, *tr.last(k), 0].each_cons(2).map(&sum_two) }
end
