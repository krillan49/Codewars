#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a method every which returns every nth element of an array.

# Usage
# With no arguments, array.every it returns every element of the array.
# With one argument, array.every(interval) it returns every intervalth element.
# With two arguments, array.every(interval, start_index) it returns every intervalth element starting at index start_index

# Examples
# [0,1,2,3,4].every      # [0,1,2,3,4]
# [0,1,2,3,4].every(1)   # [0,1,2,3,4]
# [0,1,2,3,4].every(2)   # [0,2,4]
# [0,1,2,3,4].every(3)   # [0,3]
# [0,1,2,3,4].every(1,3) # [3,4]
# [0,1,2,3,4].every(3,1) # [1,4]
# [0,1,2,3,4].every(3,4) # [4]
# Advanced features
# Negative values

# When interval is negative, you return every nth element, but count down instead of up. The start index is still relevant and still defaults to zero.

# Example:

# [0,1,2,3,4].every(-1,4)   # [4,3,2,1,0]
# But no wrapping

# When counting down from a positive index, stop when you are below zero. (This is different from Ruby's array indexing)

# Example:

# [0,1,2,3,4].every(-2,2)   # [2, 0]
# [0,1,2,3,4].every(-2,3)   # [3, 1]
# But when start_index is negative, it counts backwards from the end of the array. (This is the same behaviour as Ruby's array indexing)

# Example:

# [0,1,2,3,4].every(-1,-1)   # [4,3,2,1,0]
# [0,1,2,3,4].every(-2,-5)   # [0]
# [0,1,2,3,4].every( 1,-3)   # [2,3,4]
# Error detection

# Every makes no sense when interval is zero, so interval may NOT be zero, in this case return an ArgumentError with the message interval can't be 0

# Out of bounds indexes

# If start_index is out of bounds return an empty array.

# Notes
# In test cases:
# interval may be any integer.
# start_index may be any integer.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# You may find it useful: reverse, %

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Array
  def every(int = 1, i = 0)
    raise ArgumentError, "interval can't be 0" if int == 0
    return [] if i > self.size-1 or i.abs > self.size
    if int > 0
      self[i..-1].select.with_index{|_, j| j % int == 0}
    else
      return [0] if i == 0
      int = int.abs
      self[0..i].reverse.select.with_index{|_, j| j % int == 0}
    end
  end
end
