#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a class called Memo that allows to memoize computed results. The class instances have only the constructor and the [] operator. The constructor accepts a block, which recieves a parameter and returns the value for this parameter. This block is called when the [] operator is first called with this parameter. After that the result is memoized, and all subsequent calls to [] with that parameter return the computed value.
#
# Remember that anything can be a parameter, not necessarily a number.
#
# Example:
#
# m = Memo.new { |param| param ** 2 } # memoizing squares
#
# m[2] # => calls the block with param=2, gets 4, memoizes
# m[2] # => the second call with the same parameter returns the memoizd value without calling the block

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Memo
  def initialize(&block)
    @block = block
    @memo = {}
  end
  def [](param)
    @memo[param] ? @memo[param] : @memo[param] = @block.call(param)
  end
end
