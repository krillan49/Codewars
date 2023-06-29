#===============================================================================================================
#                                               Description
#===============================================================================================================

# A function receives a certain numbers of integers n1, n2, n3 ..., np(all positive and different from 0) and a factor k, k > 0
#
# The function rearranges the numbers n1, n2, ..., np in such order that generates the minimum number concatenating the digits and this number should be divisible by k.
#
# The order that the function receives their arguments is:
#
# rearranger(k, n1, n2, n3,....,np)
# Examples
# rearranger(4, 32, 3, 34, 7, 12)  returns "Rearrangement: 12, 3, 34, 7, 32 generates: 12334732 divisible by 4"
#
# rearranger(10, 32, 3, 34, 7, 12) returns "There is no possible rearrangement"
# If there are more than one possible arrangements for the same minimum number, your code should be able to handle those cases:
#
# rearranger(6, 19, 32, 2, 124, 20, 22) returns "Rearrangements: 124, 19, 20, 2, 22, 32 and 124, 19, 20, 22, 2, 32 generates: 124192022232 divisible by 6"
# The arrangements should be in sorted order, as you see: 124, 19, 20, 2, 22, 32 comes first than 124, 19, 20, 22, 2, 32.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def rearranger(k, *args)
  return 'There is no possible rearrangement' if k % 3 == 0 && args.join.chars.map(&:to_i).sum % 3 != 0
  arr = args.permutation.select{|e| e.join.to_i % k == 0}
  min = arr.map{|e| e.join.to_i}.min
  mins = arr.select{|e| e.join.to_i == min}.uniq
  return 'There is no possible rearrangement' if mins == []
  res = mins.sort_by{|a| a.join.to_i}.map{|a| a.join(', ')}.join(' and ')
  "Rearrangement#{mins.size > 1 ? 's' : ''}: #{res} generates: #{min} divisible by #{k}"
end
