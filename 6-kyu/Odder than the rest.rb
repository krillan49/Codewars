#===============================================================================================================
#                                               Description
#===============================================================================================================

# Integral numbers can be even or odd.
#
# Even numbers satisfy n = 2m ( with m also integral ) and we will ( completely arbitrarily ) think of odd numbers as n = 2m + 1.
# Now, some odd numbers can be more odd than others: when for some n, m is more odd than for another's. Recursively. :]
# Even numbers are just not odd.
#
# Task
# Given a finite list of integral ( not necessarily non-negative ) numbers, determine the number that is odder than the rest.
# If there is no single such number, no number is odder than the rest; return Nothing, null or a similar empty value.
#
# Examples
# oddest([1,2]) => 1
# oddest([1,3]) => 3
# oddest([1,5]) => nil
#
# Hint
# How odd is -1 ?

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def oddcount(n)
  counter = []
  until n.even?
    n = (n - 1) / 2
    return 9999 if counter[-1] == n
    counter << n
  end
  counter.size
end

def oddest(arr)
  return nil if arr == []
  ods = arr.map{|n| n.odd? ? [n, oddcount(n)] : [n, 0]}
  max = ods.max_by{|a| a[1]}[1]
  res = ods.select{|a| a[1] == max}.map(&:first)
  res.size == 1 ? res.max : nil
end
