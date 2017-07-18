class Array
  # join on different symbols depending on each
  # pair of neighboring elements
  # e.g.
  # [1,2,3,4,5,6].join_on {|x,y| (x + y) % 3 == 0 ? "*" : "&"}
  # => "1*2&3&4*5&6"
  def join_on(&block)
    interleave(each_cons(2).map(&block)).join
  end

  def interleave(arr)
    zip(arr).flatten.compact
  end
end
