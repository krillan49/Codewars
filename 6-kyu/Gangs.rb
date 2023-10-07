#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your math teacher is proposing a game with divisors, so that you can understand it better. The teacher gives you a list of divisors and a number k. You should find all the gangs in the range 1 to k.
#
# What is a gang?
# The numbers, which have the same subset of divisors from the list, form a gang. The gang can have any number of members. Any number from the range can only be in one gang. You are given the list of divisors as the first argument and the number k as the second argument.
#
# Task
# Find how many gangs can be formed from numbers in range from 1 to k.
#
# Example
# Gangs([2, 3], 6)
# => 4
#
# Gangs([2, 3, 6, 5], 15)
# => 7
#
# Explanation
# The first example:
# The numbers 1 and 5 form a gang because they don't have divisors in [2,3].
# The 2 and 4 form a gang because they both share the subset [2] from [2,3].
# The number 3 has subset [3] from [2,3] (forms a gang by itself).
# The number 6 has subset [2,3] from [2,3] (also forms a gang on its own).
# Thus, the numbers 1 through 6 are split into 4 gangs: (1,5), (2,4), (3), (6).
#
# In the same manner, for second example the gangs are: (1,7,11,13), (2,4,8,14), (3,9), (5), (6,12), (10), (15).

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def gangs(d, k)
  (1..k).map{|el| d.select{|n| el % n == 0}}.uniq.count
end
