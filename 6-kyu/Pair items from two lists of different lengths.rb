#===============================================================================================================
#                                               Description
#===============================================================================================================

# Task
# Write a function with the following properties:
#
# takes two lists
# returns a list of all possibilities to pair as many elements as possible from both lists while keeping the order of the elements
# output format is a list of lists of tuples, or a list with an empty list, if no pairs are possible
# inner lists can be of any order (see tests)
# Hints
# If both input lists are of equal length, then every item of one list will be paired with an item of the other list (see first example) -> results in only one sublist. If both input lists are of different length and not empty, then every item of the shorter list will be paired, but not every item of the larger list -> results in more than one sublist, because there are more then one possibilities to omit items from the larger list.
#
# Example 1
# Pair elements of ['c', 'o', 'd', 'e'] with elements of ['w', 'a', 'r', 's']
#
# Expected Result:
#
# [[('c', 'w'), ('o', 'a'), ('d', 'r'), ('e', 's')]]
# Example 2
# Pair elements of the following two lists:
#
# ['electric', 'horse', 'fly']
# ['1st', '2nd']
# Valid result:
#
# [[('electric', '1st'), ('horse', '2nd')],
#  [('electric', '1st'), ('fly', '2nd')],
#  [('horse', '1st'), ('fly', '2nd')]]
# Example 3
# Pair elements of ['a', 'b', 'c'] with elements of ['x', 'y']
#
# Valid Result:
#
# [[('a', 'x'), ('b', 'y')],
#  [('a', 'x'), ('c', 'y')],
#  [('b', 'x'), ('c', 'y')]]
# Example 4
# Pair elements of [1, 2] with elements of [6, 7, 8, 9]
#
# Valid Result:
#
# [[(1, 6), (2, 7)],
#  [(1, 6), (2, 8)],
#  [(1, 6), (2, 9)],
#  [(1, 7), (2, 8)],
#  [(1, 7), (2, 9)],
#  [(1, 8), (2, 9)]]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def pair_items(iter1, iter2)
  return [[]] if [iter1, iter2].any?(&:empty?)
  return [iter1.zip(iter2)] if iter1.size == iter2.size
  if iter1.size > iter2.size
    iter1.combination(iter2.size).map{|arr| arr.zip(iter2)}
  else
    iter2.combination(iter1.size).map{|arr| iter1.zip(arr)}
  end
end
