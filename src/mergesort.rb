class Array

  def merge(left, right)
    result = []

    while(!left.empty? and !right.empty?) do
      (left.first < right.first) ? result << left.shift : result << right.shift
    end

    return result +left + right
  end

  def mergesort_split
    if(self.size <= 1)
      return self
    end

    left = self[0...-(self.size/2)]
    left = left.mergesort
    right = self[-(self.size/2)..-1]
    right = right.mergesort
    
    return merge(left, right)
  end

  def mergesort
    ordered_ary = self.mergesort_split
    self.replace(ordered_ary)
  end

end
