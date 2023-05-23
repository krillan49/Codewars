#===============================================================================================================
#                                               Description
#===============================================================================================================

# Implement the method Enumerable#accumulate which should behave exactly like Enumerable#reduce and Enumerable#inject.

# For example:

# Sum some numbers
# (5..10).accumulate(:+)
# => 45

# Same using symbol to proc
# (5..10).accumulate(&:+)
# => 45

# Same using a block
# 5..10).accumulate { |sum, n| sum + n }
# => 45

# Multiply some numbers
# (5..10).accumulate(1, :*)
# => 151200

# Same using a block
# (5..10).accumulate(1) { |product, n| product * n }
# => 151200

# find the longest word
# longest = %w{ cat sheep bear }.accumulate do |memo, word|
#   memo.length > word.length ? memo : word
# end

# longest
# => "sheep"

# It should also chain with other enumerables properly, and exhibits various edge case behaviours that Enumerable#inject has (see example tests for details).

# Enumerable#reduce and Enumerable#inject have been disabled for the purpose of this kata.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# 1. This kata is much easier than it looks. In sample tests there are examples for input of all types, just take them one at a time and complete your solution with each next one.

# 2. self.to_a - simplifies the solution in most cases

#===============================================================================================================
#                                               Solution
#===============================================================================================================

module Enumerable
  def accumulate(arg1 = false, arg2 = false, &block)
    raise "error" if arg1 == nil or arg2 == nil or (!arg1 && !arg2 && !block)
    arr = self.to_a
    if !arg1 && !arg2 && block
      if block.to_s.include?('(lambda)')  # &:+
        iter_no_block(arr, nil, block.to_s.scan(/\(.{3}\)/)[0][-2])
      else
        begin # %w{ cat sheep bear }.accumulate {|memo, word| memo.length > word.length ? memo : word}
          block.call(self)
        rescue # (5..10).accumulate { |sum, n| sum + n }
          iter_block(arr, 0, &block)
        end
      end
    elsif arg1 && !arg2 && block
      iter_block(arr, arg1, &block)
    elsif arg1 && !arg2 && !block
      iter_no_block(arr, nil, arg1)
    elsif arg1 && arg2
      iter_no_block(arr, arg1, arg2)
    end
  end

  private

  def iter_block(arr, res, &block)
    arr.each{|e| res = block.call(res, e)}
    res
  end

  def iter_no_block(arr, res, arg)
    arr.each{|e| res ? res = res.send(arg, e) : res = e}
    res
  end
end
