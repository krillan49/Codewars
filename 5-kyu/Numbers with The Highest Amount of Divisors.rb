#===============================================================================================================
#                                               Description
#===============================================================================================================

# An array of different positive integers is given. We should create a code that gives us the number (or the numbers) that has (or have) the highest number of divisors among other data.
#
# The function proc_arrInt(), (Javascript: procArrInt()) will receive an array of unsorted integers and should output a list with the following results:
#
# [(1), (2), (3)]
#
# (1) - Total amount of numbers received
# (2) - Total prime numbers received
# (3) - a list [(a), (b)]
#       (a)- The highest amount of divisors that a certain number (or numbers) of the given
#            array have
#       (b)- A sorted list with the numbers that have the largest amount of divisors. The list may
#            have only one number
# Examples
# arr1 = [66, 36, 49, 40, 73, 12, 77, 78, 76, 8, 50,
#        20, 85, 22, 24, 68, 26, 59, 92, 93, 30]
#
# proc_arrInt(arr1) ------> [21, 2, [9, [36]]
#
# # 21 integers in the array
# # 2 primes: 73 and 97
# # 36 is the number that has the highest amount of divisors:
# # 1, 2, 3, 4, 6, 9, 12, 18, 36 (9 divisors, including 1 and 36)
# Another case:
#
# arr2 = [267, 273, 271, 145, 275, 150, 487, 169, 428, 50, 314, 444, 445,
#         67, 458, 211, 58, 95, 357, 486, 359, 491, 108, 493, 247, 379]
#
# proc_arrInt(arr2) ------> [26, 7, [12, [108, 150, 444, 486]]]
#
# # 26 integers in the array
# # 7 primes: 271, 487, 67, 211, 359, 491, 379
# # 108, 150, 444 and 486 have the highest amount of divisors:
# # 108: [1, 2, 3, 4, 6, 9, 12, 18, 27, 36, 54, 108] (12 divisors)
# # 150: [1, 2, 3, 5, 6, 10, 15, 25, 30, 50, 75, 150] (12 divisors)
# # 444: [1, 2, 3, 4, 6, 12, 37, 74, 111, 148, 222, 444] (12 divisors)
# # 486: [1, 2, 3, 6, 9, 18, 27, 54, 81, 162, 243, 486] (12 divisors)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def proc_arrInt(list)
  a = list.size
  b = list.select(&:prime?).size
  mdiv = list.map{|n| n == 1 ? 1 : n.prime_division.map{|a| a[1] + 1}.inject(:*)}.max
  c = list.select{|n| (n == 1 ? 1 : n.prime_division.map{|a| a[1] + 1}.inject(:*)) == mdiv}.sort
  [a, b, [mdiv, c]]
end
