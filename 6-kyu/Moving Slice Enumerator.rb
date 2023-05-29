#===============================================================================================================
#                                               Description
#===============================================================================================================

# We need an iterator to help us find the maximum slice of characters that match a String. For that goal, in this kata, we will only create the method to generate an Enumerator Object to achieve that. The method will take two values: the string and the minimum amount of characters for the slice as an integer.
#
# Write the method moving_slice_enumerator(string, min) to return an Enumerator Object we can iterate over to get the maximum to minimum slices.
#
# moving_slice_enumerator("A23456",3).to_a
# # => ["A23456","A2345","23456","A234","2345","3456","A23","234","345","456"]
# moving_slice_enumerator("QWERTY",3).take(9).last
# # => "ERT"
# The Enumerator first returns the whole string, then each smaller consecutive slice from left to right. A visual demonstration may help:
#
# Original: "A23456"
#            A23456
#            A2345
#             23456
#            A234
#             2345
#              3456
#            A23
#             234
#              345
#               456
# The method should handle all strings greater-than or equal-to the minimum integer value provided. If you get an unknown error on submission then you most likely have made an Array.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# Enumerator.new do ...

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def moving_slice_enumerator(str, min)
  n = str.size
  Enumerator.new do |y|
    until n < min
      (0..str.size-n).each do |i|
        y.yield str[i, n]
      end
      n -= 1
    end
  end
end
