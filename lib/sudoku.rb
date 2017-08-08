SudokuBoard = Struct.new(:board) do
  def rows
    board
  end

  def columns
    board.transpose
  end

  def squares
    board.each_slice(3).flat_map { |rows|
      rows.transpose.each_slice(3).map(&:flatten) }
  end
end

def valid_solution?(board)
  board = SudokuBoard.new(board)
  pandigital = -> nums { nums.sort == [*1..9] }
  [*board.rows, *board.columns, *board.squares].all?(&pandigital)
end
