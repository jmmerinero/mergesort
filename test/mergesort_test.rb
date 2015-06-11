require 'rspec'
require_relative '../src/mergesort'

RSpec.describe 'This is a mergesort implementation written in Ruby.' do

=begin
  class Array
    def mergesort
      self
    end
  end
=end

  before(:all) do
  end

  context 'The method .mergesort works over Array objects' do
    it 'is answered when it is called over Array Objects' do
      p Array.new().respond_to?(:mergesort)
      expect(Array.new().respond_to?(:mergesort)).to be true
    end

    it 'does nothing when applied over an empty Array object' do
      expect(Array.new().mergesort).to eql(Array.new())
    end

    it 'overrides the Array object over which it is applied' do
      ary = Array.new()
      expect(ary.mergesort).to be(ary)
    end
  end
end


