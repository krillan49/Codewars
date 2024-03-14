#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a positive integer n, return first n dgits of Thue-Morse sequence, as a string (see examples).
#
# Thue-Morse sequence is a binary sequence with 0 as the first element. The rest of the sequece is obtained by adding the Boolean (binary) complement of a group obtained so far.
#
# For example:
#
# 0
# 01
# 0110
# 01101001
# and so on...
#
# https://upload.wikimedia.org/wikipedia/commons/f/f1/Morse-Thue_sequence.gif
#
# Ex.:
#
# thue_morse(1);  #"0"
# thue_morse(2);  #"01"
# thue_morse(5);  #"01101"
# thue_morse(10): #"0110100110"
# You don't need to test if n is valid - it will always be a positive integer.
# n will be between 1 and 10000

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def thue_morse(n)
  f = '0'
  loop do
    return f[0..n-1] if f.size >= n
    f += f.chars.map{|e| e == '0' ? '1' : '0'}.join
  end
end
