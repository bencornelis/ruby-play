def largest_product(grid)
  [*horizontals(grid),
   *horizontals(grid.transpose),
   *diagonals(grid)].map { |four| four.reduce(:*) }.max
end

def horizontals(grid)
  grid.flat_map { |row| row.each_cons(4).to_a }
end

def diagonals(grid)
  n = grid.size
  [*0..n-4].product([*0..n-4]).flat_map do |i, j|
    [(0..3).map { |k| grid[i+k][j+k] },
     (0..3).map { |k| grid[i+3-k][j+k] }]
  end
end
