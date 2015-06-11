class Array
  def mergesort
    #self = mergesort_split(self)
    #self

    self.sort!
  end

  def self.mergesort_split(ary)
    if(ary.size == 1)
      return ary
    end

    left = mergesort_split(ary[0, -(ary.size/2)])
    right = mergesort_split(ary[-1, -(ary.size/2)])
    
    ary = merge(left, right)

    return ary
  end

  def self.merge(left, right)
    result = []

    while(!left.empty? and !rigth.empty?) do
      (left.first < right.first) ? result << left.shift : result << right.shift
    end

    return result
  end
end
