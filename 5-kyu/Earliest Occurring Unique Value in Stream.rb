#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a stream of values, return the earliest occurring unique value up to that point. If there are no unique values, return nil.
#
# For example,
#
# input(5) #=> 5
# input(3) #=> 5
# input(2) #=> 5
# input(1) #=> 5
# input(5) #=> 3
# input(3) #=> 2
# input(1) #=> 2
# input(0) #=> 2
# input(2) #=> 0
# Your function should be handle objects of any type, not just ints. Test cases include floats and strings! Note: the input may be extremely long, so be mindful of speed!

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# 2 Sets

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'set'

class UniqueFinder
  def initialize
    @nums = []
    @nnums = Set.new
    @dubles = Set.new
  end

  def input(n)
    return @nums[0] if @dubles.include?(n)
    if @nnums.include?(n)
      @dubles << n
      while @dubles.include?(@nums[0])
        @nums.shift
      end
    else
      @nums << n
      @nnums << n
    end
    @nums[0]
  end
end
