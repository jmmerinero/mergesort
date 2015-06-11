class Array

  def merge(left, right, &block)
    result = []

#    left.each do |a|
#      if(block_given?)
        	


    while(!left.empty? and !right.empty?) do
      #p block_given?
      comp = (block_given? ? block.call(left.first, right.first) : left.first <=> right.first)
      #p comp
      (comp < 0) ? result << left.shift : result << right.shift
    end

    return result +left + right
  end

  def mergesort_split(&block)
    if(self.size <= 1)
      return self
    end

    left = self[0...-(self.size/2)]
    left = left.mergesort_split(&block)
    right = self[-(self.size/2)..-1]
    right = right.mergesort_split(&block)
    
    return merge(left, right, &block)
  end

  def mergesort(&block)
    ordered_ary = self.mergesort_split(&block)
    self.replace(ordered_ary)
  end

end
