#===============================================================================================================
#                                               Description
#===============================================================================================================

# A bar of a certain metal of length l is subjected to the application of different perpendicular forces (that may have up or down direction). The bar has a foothold at its midpoint  S . Each point of application of the force is at a distance that has an integer value, respect to the point  S.
#
# https://imgur.com/KJkXsbl
#
# The array that represents the system drawn above is : [2, -3, 1, 2, 'S', 3, -4, 0, 2]
#
# We are interested in a code that may predict if the bar will rotate with clockwise or anti clockwise spin, or the bar will remain steady.
#
# From Physics we will need the concept of Moment of a Force.
#
# As all the forces are coplanar (the same plane) and the equation of the magnitude of the resultant Moment is:
#
# https://imgur.com/3fBS9nD
#
# Applying the equation to our situation, we will have:
#
# M = 2*(-4) + (-3)*(-3) + 1*(-2) + 2*(-1) + 3*1 + (-4)*2 + 0*3 + 2*4 = -8 + 9 - 2 - 2 + 3 - 8 + 8 = 0
# As the result of the total moment for all the applied forces is 0, the bar will not rotate.
#
# Suposse that we change a bit the situation having a new force, of magnitud 5 that goes up, at the empty point, on the right of S, at distance +3.
#
# Now the resultant Moment is (-5) * 3 = -15, that means that the bar will rotate anti clockwise.
#
# The function: rot_pred() (rotPred() in Javascript) will an array of odd amount of terms and a string 'S' in the middle.
#
# python
# rot_pred([2, -3, 1, 2, 'S', 3, -4, 0, 2]) == 'steady'
#
# rot_pred([2, -3, 1, 2, 'S', 3, -4, -5, 2]) == 'anti clockwise' (
# If the amount of elements on the right and on the left of S do not coincide the function will reject the entry.
#
# rot_pred([2, -3, 1, 2 'S', 3, -4, -5]) == 'Not a Valid Entry'

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def rot_pred(arr)
  i = arr.index('S')
  return 'Not a Valid Entry' if arr[0...i].size != arr[i+1..-1].size
  res = arr[0...i].reverse.map.with_index{|e, j| e * (-j - 1)}.sum + arr[i+1..-1].map.with_index{|e, j| e * (j + 1)}.sum
  res > 0 ? 'clockwise' : res < 0 ? 'anti clockwise' : 'steady'
end
