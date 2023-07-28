#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given a string containing 0's, 1's and one or more '?', where ? is a wildcard that can be 0 or 1.
#
# Return an array containing all the possibilities you can reach substituing the ? for a value.
#
# Examples
# '101?' -> ['1010', '1011']
#
# '1?1?' -> ['1010', '1110', '1011', '1111']
# Notes:
#
# Don't worry about sorting the output.
# Your string will never be empty.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def possibilities(string)
  s = [string]
  c = 0
  until s.join.count('?') == 0
    s = s.map{|e| e[c] == '?' ? [e[0...c]+'0'+e[c+1..-1], e[0...c]+'1'+e[c+1..-1]] : e}.flatten
    c += 1
  end
  s
end
