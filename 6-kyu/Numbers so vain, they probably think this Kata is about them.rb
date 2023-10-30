#===============================================================================================================
#                                               Description
#===============================================================================================================

# Well, those numbers were right and we're going to feed their ego.
#
# Write a function, isNarcissistic, that takes in any amount of numbers and returns true if all the numbers are narcissistic. Return false for invalid arguments (numbers passed in as strings are ok).
#
# For more information about narcissistic numbers (and believe me, they love it when you read about them) follow this link: https://en.wikipedia.org/wiki/Narcissistic_number

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def is_narcissistic(*arr)
  arr.all?{|n| n.to_s.tr('0-9', '') == '' && n.to_i.digits.sum{|d| d**n.to_s.size} == n.to_i}
end
