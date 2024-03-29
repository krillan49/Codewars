#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your job is to create a function, (random_ints in Ruby/Python/Crystal, and randomInts in JavaScript/CoffeeScript) that takes two parameters, n and total, that will randomly identify n non-negative integers that sum to the total. Note that [1, 2, 3, 4] and [2, 3, 4, 1] are considered to be 'the same array' when it comes to this kata.
#
# How the function will be called:
# random_ints(n, total)
#   # where n and total are non-negative integers, and the return type is an array of integers
# Some example cases; however, do note that the integer inputs in the actual test suite are much larger in order to reduce the likelihood of two tests from being equal from chance:
# random_ints(3, 5) # all of the following are valid, but MUST NOT be repeated more than once when testing
#     [1, 2, 2]
#     [2, 3, 0]
#     [1, 1, 3]
#     …
# random_ints(2, 6) # all of the following are valid, but MUST NOT be repeated more than once when testing
#     [2, 4]
#     [0, 6]
#     [1, 5]
#     …
# Although it may seem like overkill, the reason there are so many random tests is to ensure your outputs are 'random enough'; ie. if your code fails repeatedly, it is probably because not enough array elements are randomized fully.
#
# As said earlier, due to the size of the inputs, it is highly unlikely (out of 10 submissions, it hasn't happened to me) that your code will fail due to pure chance/unluckiness. But nevertheless, it is still possible, so just to make sure, do run your code again in the event that it fails.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def random_ints(n, total)
  arr = Array.new(n){rand((total / n.to_f).ceil + 1)}
  arr[rand(n)] += total - arr.sum
  arr
end
