FILL = '*'.freeze
MOVES = [
  [0, 1],    # first down
  [1, 0],    # then  right
  [0, -1],   # then  up
  [-1, 0]    # then  left
].freeze

def spiral(n)
  grid_size = n.odd? ? n : n + 1
  grid = Array.new(grid_size) { Array.new(grid_size, ' ') }
  x = y = grid_size/2

  grid[y][x] = FILL
  (1..n-1).each do |k|
    move = MOVES[(k - 1) % 4]
    k.times do
      x += move.first
      y += move.last
      grid[y][x] = FILL
    end
  end

  puts grid.map(&:join).join("\n")
end
