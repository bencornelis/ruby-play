# iterative binary search
def binary_search(items, v)
  l, r = 0, items.size - 1
  until r < l
    m = (l + r)/2
    if v > items[m]
      l = m + 1
    elsif v < items[m]
      r = m - 1
    else
      return m
    end
  end
end

# recursive binary search
# def binary_search(items, v)
#   def search(items, v, l, r)
#     return nil if r < l
#     m = (l + r)/2
#     if v > items[m]
#       return search(items, v, m + 1, r)
#     elsif v < items[m]
#       return search(items, v, l, m - 1)
#     else
#       return m
#     end
#   end
#
#   return search(items, v, 0, items.size - 1)
# end
