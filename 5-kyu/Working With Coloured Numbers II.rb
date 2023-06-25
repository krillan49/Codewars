#===============================================================================================================
#                                               Description
#===============================================================================================================

# Different colour pattern lists produce different numerical sequences in colours.
#
# For example the sequence ['red', 'yellow'', 'blue''], produces the following coloured sequence:
#
# 1 2 3 4 5 6 7 8 9 10 11 12 13.....
#
# The sequence ['red', 'yellow', 'blue', 'orange', 'green'] produce the sequence:
#
# 1 2 3 4 5 6 7 8 9 10 11 12 13.....
#
# We have the following recursive sequence:
#
# a1 = 1
# an = an-1 + n + k
# having that k may be positive or negative.
#
# Task
# Create a function count_col_hits(), (javascript countColHits()that receives the following arguments:
#
# the value of k
#
# a certain pattern colour list, pat_col,or array of colours (that has an specific order as it was shown above)
#
# a range of values, range_, an array of two elements, having a lower and upper bound, [a, b], such that a < b
#
# The function should output an array with two elements:
#
# the maximum number of hits that each colour has in the range [a, b], such that every value, val, that hits the sequence of coloured numbers are such that, a ≤ val ≤ b
#
# the corresponding name of the colour that produces this maximum amount of hits (or it may be also colours that produce the maximum amount of hits).
#
# Examples
# k = -4
# pat_col = ['red', 'yellow', 'blue', 'orange', 'green']
# range_ = [20, 40]
#
# ith term    value     colour     hit or not
# 1             1         red         yes
# 2            -1         ---          no   (negative values do not hit)
# 3            -2         ---          no
# 4            -2         ---          no
# 5            -1         ---          no
# 6             1         red         yes
# 7             4        orange       yes
# 8             8         blue        yes
# 9            13         blue        yes
# 10           19        orange       yes
# 11           26         red         yes <---- hit in the range, 20 ≤ 26 ≤ 40
# 12           34        orange       yes <---- hit in the range, 20 ≤ 34 ≤ 40
#
# count_col_hits(k, pat_col, range_) == [1, ['orange', 'red']]  # If there is more than one colour the array should be sorted alphabetically
# Having another case changing the input:
#
# k = -7
# pat_col = ['red', 'yellow', 'blue', 'orange', 'green', 'pink']
# range_ = [20, 150]
#
# count_col_hits(k, pat_col, range_) == [4, 'orange'] #If there is only one colour with maximum amount of hits there is no need to use an array of colours in the result.
#
# # The other colours had the result: 'red': 3, 'green': 2, 'yellow': 1, 'blue': 0, 'pink': 0
# Your code should handle carefully the cases where there are no hits at all. For that case the output should be an empty array.
#
# k = 50
# pat_col = ['red', 'yellow', 'blue', 'orange', 'green', 'pink']
# range_ = [20, 50]
# count_col_hits(k, pat_col, range_) == []
# You will be always receiving valid inputs for the arguments of the function.
#
# Features of the random tests:
#
# Numpber of tests: 200
# -100 ≤  k ≤  100
# length of pattern colour array: 5 ≤ l ≤ 20
# 100 ≤ a  ≤ 100000, 1000 ≤ b ≤ 10**8 and always a < b

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def count_col_hits(k, col, range)
  foll, n = 1, 1
  arr = []
  until foll >= range[-1]
    foll += n + 1 + k
    n += 1
    arr << foll if foll.between?(range[0], range[1])
  end
  return [] if arr.empty?
  arr = arr.map{|e| col[e % col.size - 1]}.group_by{|e| e}.map{|key, val| [key, val.size]}
  max = arr.max_by{|key, val| val}[1]
  res = arr.select{|a| a[1] == max}.map{|a| a[0]}
  [max, res.size == 1 ? res.join : res.sort]
end
