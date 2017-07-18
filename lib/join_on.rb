class Array
  def join_on(&block)
    interleave(each_cons(2).map(&block)).join
  end

  def interleave(arr)
    zip(arr).flatten.compact
  end
end
