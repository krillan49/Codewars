#===============================================================================================================
#                                               Description
#===============================================================================================================

# #Split all even numbers to odd ones in different ways
#
# Your task is to split all even numbers from an array to odd ones. So your method has to return a new array with only odd numbers.
#
# For "splitting" the numbers there are four ways.
#
# 0 -> Split into two odd numbers, that are closest to each other.
#      (e.g.: 8 -> 3,5)
# 1 -> Split into two odd numbers, that are most far from each other.
#      (e.g.: 8 -> 1,7)
# 2 -> All new odd numbers from the splitting should be equal and the maximum possible number.
#      (e.g.: 8 -> 1, 1, 1, 1, 1, 1, 1, 1)
# 3 -> Split into 1s.
#      (e.g.: 8 -> 1, 1, 1, 1, 1, 1, 1, 1)
# The new numbers (from the splitting) have always to be in ascending order.
# So in the array every even number is replaced by the new odd numbers from the splitting.
# Your method will get as parameters the input-array and the number of the way for splitting the even numbers.
#
# Some Examples
#
# [1,10,1,3],0 -> [1,5,5,1,3]
# [1,10,1,3],1 -> [1,1,9,1,3]
# [1,10,1,3],2 -> [1,5,5,1,3]
# [1,10,1,3],3 -> [1,1,1,1,1,1,1,1,1,1,1,1,3]
#
# [1,1,3,8],0 -> [1,1,3,3,5]
# [1,1,3,8],1 -> [1,1,3,1,7]
# [1,1,3,8],2 -> [1,1,3,1,1,1,1,1,1,1,1]
# [1,1,3,8],3 -> [1,1,3,1,1,1,1,1,1,1,1]
# The array will never be null and will always contain only integer numbers > 0. Also your result-array must contain only integer numbers > 0. The way-parameter will always be between inclusive 0 and inclusive 3 (0,1,2,3).
#
# You must not change the input-array!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def split_all_even_numbers(num, way)
  if way == 0
    num.map{|n| n.odd? ? n : (n/2).odd? ? [n/2, n/2] : [n/2-1, n/2+1]}.flatten
  elsif way == 1
    num.map{|n| n.odd? ? n : [1, n-1]}.flatten
  elsif way == 2
    num.map do |n|
      if n.odd?
        n
      else
        m = (2..n).select{|k| (n / k).odd? && n.to_f / k % 1 == 0}.min
        [n / m] * m
      end
    end.flatten
  elsif way == 3
    num.map{|n| n.odd? ? n : [1] * n}.flatten
  end
end
