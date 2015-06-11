require 'rspec'
require_relative '../src/mergesort'

RSpec.describe 'This is a mergesort implementation written in Ruby.' do

  before(:all) do
  end

  context 'The method .mergesort works over Array objects' do
    it 'is answered when it is called over Array Objects' do
      expect(Array.new().respond_to?(:mergesort)).to be true
    end

    it 'does nothing when applied over an empty Array object' do
      expect(Array.new().mergesort).to eql(Array.new())
    end

    it 'overrides the Array object over which it is applied' do
      ary = [4, 3, 2, 1]
      expect(ary.mergesort).to be(ary)
    end
    
    it 'orders Array objects filled with an even number of Fixnum objects' do
      ary = [4, 3, 2, 1]
      expect(ary.mergesort).to eql([1, 2, 3, 4])
    end
    
    it 'orders Array objects filled with an odd number of Fixnum objects' do
      ary = [5, 4, 3, 2, 1]
      expect(ary.mergesort).to eql([1, 2, 3, 4, 5])
    end

    it 'orders from bigger to smaller Array objects filled with Fixnum objects' do
      ary = [1, 2, 3, 4, 5]
      expect(ary.mergesort{|a, b| -(a<=>b)}).to eql([5, 4, 3, 2, 1])
    end


    it 'orders Array objects filled with String objects' do
      ary = ['d', 'c', 'b', 'a']
      expect(ary.mergesort).to eql(['a', 'b', 'c', 'd'])
    end

    it 'orders from bigger to smaller Array objects filled with String objects' do
      ary = ['a', 'b', 'c', 'd']
      expect(ary.mergesort{|a, b| -(a<=>b)}).to eql(['d', 'c', 'b', 'a'])
    end
  end
end


