#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a method called "power" that takes two integers and returns the value of the first argument raised to the power of the second. Return nil if the second argument is negative.
#
# Note: The ** operator has been disabled.
#
# Examples:
#
# power(2, 3) # 8
# power(10, 0) # 1
# power(-5, 3) # -125
# power(-4, 2) # 16

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def power(base, e)
  return nil if e < 0
  return 1 if e == 0
  n = base
  (e-1).times{ base *= n }
  base
end
