#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this Kata, we are going to determine if the count of each of the characters in a string can be equal if we remove a single character from that string.
#
# For example:
#
# solve('abba') = false -- if we remove any character, the count of each character will not be equal.
# solve('abbba') = true -- if we remove one b, the count of each character becomes 2.
# solve('aaaa') = true -- if we remove one character, the remaining characters have same count.
# solve('wwwf') = true -- if we remove f, the remaining letters have same count.
# More examples in the test cases. Empty string is not tested.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def solve (s)
  a = s.chars
  r = a.uniq.map{|c| a.count(c)}.uniq
  r0 = a.uniq.map{|c| a.count(c)}
  a.uniq.size == 1 || a.all?{|c| a.count(c) == 1} || (r.size == 2 && (r[0] - r[1]).abs == 1) || (r0.size == 2 && r.include?(1))
end
