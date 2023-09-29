#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your operating system screwed some things up. It has received some unsigned 32 bit integer from the Internet, but nobody told your OS about the "network byte order" and his "host byte order".
#
# Your job is to write a function ntoh which takes a 32 bit unsigned integer in the Big Endian byte order and returns the correct 32 bit unsigned integer in the Little Endian order.
#
# To refresh your knowledge about byte order. One byte are 8 bits, so a 32 bit unsigned integer consists of 4 bytes which are ordered the wrong way.
#
# If an integer longer than 32 bit is given the function has to raise a nasty exception.
#
# Example:
#
# * 42949695 => 1063030530
# 42949695 as a 32 bit integer is
#
# 00000010 10001111 01011100 00111111 which translates to
#
# 00111111 01011100 10001111 00000010 which is 1063030530.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def ntoh(n)
  n = n.to_s(2)
  raise XyeBoe if n.size > 32
  n = '0' * (32 - n.size) + n if n.size < 32
  n.chars.each_slice(8).to_a.reverse.join.to_i(2)
end
