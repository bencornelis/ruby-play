class Array
  def column(i)
    map { |row| row[i] }
  end

  def transpose
    (0...self[0].size).map { |i| column(i) }
  end
end
