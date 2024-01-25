#===============================================================================================================
#                                               Description
#===============================================================================================================

# Binary with 0 and 1 is good, but binary with only 0 is even better! Originally, this is a concept designed by Chuck Norris to send so called unary messages.
#
# Can you write a program that can send and receive this messages?
#
# Rules
# The input message consists of ASCII characters between 32 and 127 (7-bit)
# The encoded output message consists of blocks of 0
# A block is separated from another block by a space
# Two consecutive blocks are used to produce a series of same value bits (only 1 or 0 values):
# First block is always 0 or 00. If it is 0, then the series contains 1, if not, it contains 0
# The number of 0 in the second block is the number of bits in the series
# Example
# Let’s take a simple example with a message which consists of only one character (Letter 'C').
# 'C' in binary is represented as 1000011, so with Chuck Norris’ technique this gives:
# 0 0 - the first series consists of only a single 1
# 00 0000 - the second series consists of four 0
# 0 00 - the third consists of two 1
# So 'C' is coded as: 0 0 00 0000 0 00
#
# Second example, we want to encode the message "CC" (i.e. the 14 bits 10000111000011) :
# 0 0 - one single 1
# 00 0000 - four 0
# 0 000 - three 1
# 00 0000 - four 0
# 0 00 - two 1
# So "CC" is coded as: 0 0 00 0000 0 000 00 0000 0 00

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def send(s)
  s.chars
   .map{|c| c.ord.to_s(2)}
   .map{|n| n.size < 7 ? '0' * (7 - n.size) + n : n}
   .join
   .chars
   .slice_when{|a, b| a != b}
   .map{|a| a[0]=='1' ? '0 ' + '0' * a.size : '00 ' + '0' * a.size}
   .join(' ')
end

def receive(s)
  s.split
   .each_slice(2)
   .map{|a| a[0] == '0' ? '1' * a[1].size : '0' * a[1].size}
   .join
   .chars
   .each_slice(7)
   .map{|a| a.join.to_i(2).chr}
   .join
end
