#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this Kata, you will be given a string of numbers in sequence and your task will be to return the missing number. If there is no number missing or there is an error in the sequence, return -1.
#
# For example:
#
# missing("123567") = 4
# missing("899091939495") = 92
# missing("9899101102") = 100
# missing("599600601602") = -1 -- no number missing
# missing("8990919395") = -1 -- error in sequence. Both 92 and 94 missing.
# The sequence will always be in ascending order.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def missing_helper(e, s)
  num = []
  until s == '' or s.size < e.to_s.size
    if s.index("#{e + 1}") == 0
      e += 1
    elsif s.index("#{e + 2}") == 0
      num << e + 1
      e += 2
    else
      return nil
    end
    s = s[e.to_s.size..-1]
    return nil if num.size > 1
  end
  num.max
end

def missing(s)
  (1..s.size/2).each do |n|
    res = missing_helper(s[0, n].to_i, s[n..-1])
    return res if res
  end
  -1
end
