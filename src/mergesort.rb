class Array

def merge(left, right, &block)
  result = []
  (block = lambda {|a, b| a<=>b}) unless block_given?

  while(!left.empty? and !right.empty?) do
    if (block.call(left.first, right.first) <= 0)
      result << left.shift #.shift is destructive, .first isn't
    else
      result << right.shift
    end
  end

  # while loop doesn't empty both arys
  return result + left + right
end

def mergesort(&block)
  if(self.size <= 1)
    return self
  end

  # [-5|-4 |-3 |-2 |-1 ]
  # [a , b , c , d , e ]  size = 5; size/2 = 2
  # [0 | 1 | 2 | 3 | 4 ]
  # [a , b , c ]         = [0...-2]
  #             [d , e ] = [-2..-1]
  #
  # [-4|-3 |-2 |-1 ] 
  # [a , b , c , d ]  size = 4; size/2 = 2
  # [0 | 1 | 2 | 3 ]
  # [a , b ]         = [0...-2]
  #        [ e , d ] = [-2..-1]

  left = self[0...-(self.size/2)]
  right = self[-(self.size/2)..-1]
  
  left.mergesort(&block)
  right.mergesort(&block)
  
  return self.replace(merge(left, right, &block))
end

end
