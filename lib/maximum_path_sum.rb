def maximum_path_sum(triangle)
  triangle.each_cons(2) do |prev_row, cur_row|
    best_path_sums = [0, *prev_row, 0].each_cons(2).map(&:max)
    cur_row.map!.with_index { |num, i| num + best_path_sums[i] }
  end
  triangle.last.max
end
