require 'rspec'
require_relative '../src/mergesort'

RSpec.describe 'This is a mergesort implementation written in Ruby.' do

  before(:all) do
  end

  context 'The method .mergesort works over Array objects' do
    it 'is answered when it is called over Array Objects' do
      expect(Array.new().answer_to?(:mergesort))
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


