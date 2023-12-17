#===============================================================================================================
#                                               Description
#===============================================================================================================

# Assume we take a number x and perform any one of the following operations:
#
# a) Divide x by 3 (if it is divisible by 3), or
# b) Multiply x by 2
# After each operation, we write down the result. If we start with 9, we can get a sequence such as:
#
# [9,3,6,12,4,8] -- 9/3=3 -> 3*2=6 -> 6*2=12 -> 12/3=4 -> 4*2=8
# You will be given a shuffled sequence of integers and your task is to reorder them so that they conform to the above sequence. There will always be an answer.
#
# For the above example:
# solve([12,3,9,4,6,8]) = [9,3,6,12,4,8].

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def solve arr
  return arr.sort if arr.all?{|e| e % 3 != 0}
  res = [arr.max]
  arr.delete(arr.max)
  until arr.empty?
    d2 = arr.find{|e| e * 2 == res[0]}
    d3 = arr.find{|e| e * 3 == res[-1]}
    m2 = arr.find{|e| e == res[-1] * 2}
    m3 = arr.find{|e| e == res[0] * 3}
    if d3
      res.push(arr.delete(d3))
    elsif m2
      res.push(arr.delete(m2))
    end
    if m3
      res.unshift(arr.delete(m3))
    elsif d2
      res.unshift(arr.delete(d2))
    end
  end
  res
end
