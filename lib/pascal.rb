def pascals_triangle(n)
  (n - 1).times.inject([[1]]) { |triangle|
    triangle << next_row(triangle) }
end

def next_row(triangle)
  [0, *triangle.last, 0].each_cons(2).map { |x, y| x + y }
end
