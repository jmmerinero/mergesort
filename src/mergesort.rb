class Array

  def merge(left, right, &block)
    result = []

    while(!left.empty? and !right.empty?) do
      comp = (block_given? ? block.call(left.first, right.first) : left.first <=> right.first)
      (comp < 0) ? result << left.shift : result << right.shift
    end

    return result +left + right
  end

  def mergesort(&block)
    if(self.size <= 1)
      return self
    end

    left = self[0...-(self.size/2)]
    left = left.mergesort(&block)
    right = self[-(self.size/2)..-1]
    right = right.mergesort(&block)
    
    self.replace(merge(left, right, &block))
  end

end
