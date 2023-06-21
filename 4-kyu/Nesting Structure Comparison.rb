#===============================================================================================================
#                                               Description
#===============================================================================================================

# Complete the function/method (depending on the language) to return true/True when its argument is an array that has the same nesting structures and same corresponding length of nested arrays as the first array.
#
# For example:
#
# # should return true
# [ 1, 1, 1 ].same_structure_as( [ 2, 2, 2 ] )
# [ 1, [ 1, 1 ] ].same_structure_as( [ 2, [ 2, 2 ] ] )
#
# # should return false
# [ 1, [ 1, 1 ] ].same_structure_as( [ [ 2, 2 ], 2 ] )
# [ 1, [ 1, 1 ] ].same_structure_as( [ [ 2 ], 2 ] )
#
# # should return true
# [ [ [ ], [ ] ] ].same_structure_as( [ [ [ ], [ ] ] ] );
#
# # should return false
# [ [ [ ], [ ] ] ].same_structure_as( [ [ 1, 1 ] ] )

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Array
  def same_structure_as(obj)
    return false if self.class != obj.class
    sclone = self.clone
    n = 0
    until obj == obj.flatten && sclone == sclone.flatten
      sclone, obj = sclone.flatten(n), obj.flatten(n)
      return false if sclone.size != obj.size
      obj.size.times{|i| return false if obj[i].class != sclone[i].class}
      n += 1
    end
    true
  end
end
