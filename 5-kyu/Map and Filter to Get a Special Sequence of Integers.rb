#===============================================================================================================
#                                               Description
#===============================================================================================================

# We have an integern, with a certain number of digitsk,
#
# ...
#
# (Yes, we consider here that 00 is equals to 1, following the output that give most programming languages)
#
# The first terms of this special sequence of numbers are:
#
# 100, 101, 110, 121, 132, 143, 154, 165,...
# The function prev_next() (in javascript: prevNext())will receive a certain integer n and will output the highest possible number of this sequence under n and the smallest possible number of this sequence higher than n.
#
# For example
#
# prev_next(150) == [143, 154]
# If a number is part of this sequence will output three values, istself and the next previous and next one:
#
# prev_next(154) == [143, 154, 165]
# If there are no numbers below the given number, the function will output the next number of the sequence.
#
# prev_next(99) == [100]
# prev_next(100) == [100, 101]
# Features of the random tests:
#
# Numbers of tests = 100
# n, such that, 100 ≤ n < 1000000

#===============================================================================================================
#                                               Solution
#===============================================================================================================

SEK = (100...1000000).select do |n|
  arr = n.digits.reverse
  arr.map.with_index{|d, i|
    if i == arr.size-1
      d
    else
      d > arr[i+1] ? -(d**(d - arr[i+1]).abs) : d**(d - arr[i+1]).abs
    end
  }.sum == 0
end

def prev_next(n)
  return [100] if n < 100
  return [100, 101] if n == 100
  mid = SEK.include?(n) ? n : nil
  prev = SEK.take_while{|e| e < n}[-1]
  last = mid ? SEK[SEK.index(mid)+1] : SEK[SEK.index(prev)+1]
  [prev, mid, last].compact
end
