#===============================================================================================================
#                                               Description
#===============================================================================================================

# While most devs know about big/little-endianness, only a selected few know the secret of real hard core coolness with mid-endians.
#
# Your task is to take a number and return it in its mid-endian format, putting the most significant couple of bytes in the middle and all the others around it, alternating left and right.
#
# For example, consider the number 9999999, whose hexadecimal representation would be 98967F in big endian (the classic you get converting); it becomes 7F9698 in little-endian and 96987F in mid-endian.
#
# Write a function to do that given a positive integer (in base 10) and remembering that you need to pad with 0s when you get a single hex digit!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def mid_endian(n)
  n = (n.to_s(16).size.odd? ? '0' : '') + n.to_s(16)
  res = []
  n.chars.each_slice(2).map(&:join).each.with_index{|b, i| i.even? ? res << b : res.unshift(b) }
  res.join.upcase
end
