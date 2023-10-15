#===============================================================================================================
#                                               Description
#===============================================================================================================

# The Sharkovsky's Theorem involves the following ordering of the natural numbers:
#
# 3≺5≺7≺9≺...
# ≺2⋅3≺2⋅5≺2⋅7≺2⋅9≺...
# ≺2**n⋅3≺2**n⋅5≺2**n⋅7≺2**n⋅9≺...
# ≺2**(n+1)⋅3≺2**(n+1)⋅5≺2**(n+1)⋅7≺2**(n+1)⋅9≺...
# ≺2**n≺2**(n−1)≺...
# ≺4≺2≺1
# Your task is to complete the function which returns true if a≺b according to this ordering, and false otherwise.
#
# You may assume both a and b are non-zero positive integers.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def sharkovsky(a, b)
  return false if a == 1 or a == b
  return true if b == 1
  ap = a.prime_division.map{|a| a[0] == 2 ? a : a[0]**a[1]}
  bp = b.prime_division.map{|a| a[0] == 2 ? a : a[0]**a[1]}
  ap.unshift([2,0]) if ap[0][0] != 2
  bp.unshift([2,0]) if bp[0][0] != 2
  return false if ap.size == 1 && (bp.size > 1 || (bp.size == 1 && b > a))
  !(ap.size > 1 && bp.size > 1 && (ap[0][1] > bp[0][1] || (ap[0][1] == bp[0][1] && b < a)))
end
