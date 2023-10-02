#===============================================================================================================
#                                               Description
#===============================================================================================================

# The goal is to write a pair of functions the first of which will take a string of binary along with a specification of bits, which will return a numeric, signed complement in two's complement format. The second will do the reverse. It will take in an integer along with a number of bits, and return a binary string.
#
# https://en.wikipedia.org/wiki/Two's_complement
#
# Thus, to_twos_complement should take the parameters binary = "0000 0001", bits = 8 should return 1. And, binary = "11111111", bits = 8 should return -1 . While, from_twos_complement should return "00000000" from the parameters n = 0, bits = 8 . And, "11111111" from n = -1, bits = 8.
#
# You should account for some edge cases.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def to_twos_complement(binary, bits)
  binary.tr!(' ', '')
  binary[-bits] == '1' ? (2**bits - binary.to_i(2))*-1 : binary.to_i(2)
end

def from_twos_complement(n, bits)
  res = n >= 0 ? n.to_s(2) : (2**bits + n).to_s(2)
  res.size < bits ? '0' * (bits - res.size) + res : res
end
