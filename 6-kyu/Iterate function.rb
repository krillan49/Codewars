#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write the method Object#iterate that given an object takes a block as argument and an optional count n.
#
# If n is given it returns an array of length n where each element can obtained by the successive application of the block on the object, starting with the object.
#
# If n is not given, it returns an Enumerator that yields the successive application of the block on the object indefinitely.
#
# Example:
#
# 'str'.iterate(3) {|s| s * 2 } # => ["str", "strstr", "strstrstrstr"]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Object
  def iterate(n=nil, &b)
    el = self.clone
    n ? n.times.with_object([]){|_, res| res << el; el = yield(el)} : Enumerator.new{|y| loop{ y << el; el = yield(el)} }
  end
end
