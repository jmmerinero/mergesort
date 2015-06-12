require_relative './test_helper'

RSpec.describe 'This is a mergesort implementation written in Ruby.' do
  before(:all) do
  end

  context 'The method .mergesort' do
    it 'is answered when it is called over Array Objects' do
      expect([].respond_to?(:mergesort)).to be true
    end

    it 'does nothing when applied over an empty Array object' do
      expect([].mergesort).to eql([])
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

    it 'orders Array objects filled with Fixnum objects (branch coverage)' do
      ary = [7, 5, 4, 6, 2, 3, 1]
      expect(ary.mergesort).to eql([1, 2, 3, 4, 5, 6, 7])
    end

    it 'orders from bigger to smaller Array objects filled with Fixnum objects' do
      ary = [1, 2, 3, 4, 5]
      expect(ary.mergesort { |a, b| -(a <=> b) }).to eql([5, 4, 3, 2, 1])
    end

    it 'orders Array objects filled with String objects' do
      ary = %w(d c b a)
      expect(ary.mergesort).to eql(%w(a b c d))
    end

    it 'orders from bigger to smaller Array objects filled with String objects' do
      ary = %w(a b c d)
      expect(ary.mergesort { |a, b| -(a <=> b) }).to eql(%w(d c b a))
    end

    it "raises an Exception object when can't do the merge" do
      ary = [2, 3, 1, 9, nil]
      expect { (ary.mergesort) }.to raise_error(ArgumentError)
    end
  end
end
