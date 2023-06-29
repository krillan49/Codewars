#===============================================================================================================
#                                               Description
#===============================================================================================================

# This kata was thaught to continue with the topic of Tracking Hits for Different Sum Values for Different Kinds of Dice see at:http://www.codewars.com/kata/56f852635d7c12fb610013d7
#
# In that kata we show the different sum values obtained rolling 3 tetrahedral dice. There is a table that shows how values 7 and 8 are the most probable sum values to obtain, having the highest probability of all, 0.1875.
#
# Looking the image, if we take dice from a row(up to 7 elements) we will have the same type dice (different colours)
#
# The probability is obtained doing the quotient between the total different combinations and total of cases.
#
# probability(tetraedral_dice, 3, sum) = different_combinations_for_sum / total cases = 12 /(4*4*4) = 0.1875
# The function most_prob_sum() will receive two arguments:
#
# a string with the type dice, one the following ones:
# 'tetrahedral', 'cubic', 'octahedral', 'ninesides', 'tensides', 'dodecahedral', 'icosahedral'.
# a number n, that is the amount of rolled dice.
# The corresponding range for each die are :
#
# 'tetrahedral'      [1, 4]
# 'cubic'            [1, 6]
# 'octahedral'       [1, 8]
# 'ninesides'        [1, 9]
# 'tensides'         [1, 10]
# 'dodecahedral'     [1, 12]
# 'icosahedral'      [1, 20]
# Let's see the output of the function with the given example:
#
# most_prob_sum('tetrahedral', 3) == [[7, 8], 0.1875]
# We need a list with two terms, the first one: a sorted list with the most probable sum value(s) and the second one: the maximum probability value.
#
# For this kata we will have more challenging tests than the previous one,so we will need an optimized version for the solution.
#
# More example cases are given in the Example Test Cases box.
#
# Do not round the results for the probability value.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

DICE = {'tetrahedral'=>4,'cubic'=>6,'octahedral'=>8,'ninesides'=>9,'tensides'=>10,'dodecahedral'=>12,'icosahedral'=>20}

def most_prob_sum(dice, n)
  all = [(1..DICE[dice]).to_a] * n
  sums = all[0].product(*all[1..-1]).map(&:sum)
  counts = sums.uniq.map{|s| [sums.count(s), s]}
  max_count = counts.max_by{|a| a[0]}[0]
  [counts.select{|c| c[0] == max_count}.map{|a| a[1]}, max_count.to_f / sums.size]
end
