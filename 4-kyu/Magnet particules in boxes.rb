#===============================================================================================================
#                                               Description
#===============================================================================================================

# Professor Chambouliard hast just discovered a new type of magnet material. He put particles of this material in a box made of small boxes arranged in K rows and N columns as a kind of 2D matrix K x N where K and N are postive integers. He thinks that his calculations show that the force exerted by the particle in the small box (k, n) is:
#
# https://www.codewars.com/kata/56c04261c3fcf33f2d000534/ruby
#
# Task:
# To help Professor Chambouliard can we calculate the function doubles that will take as parameter maxk and maxn such that doubles(maxk, maxn) = S(maxk, maxn)? Experiences seems to show that this could be something around 0.7 when maxk and maxn are big enough.
#
# Examples:
# doubles(1, 3)  => 0.4236111111111111
# doubles(1, 10) => 0.5580321939764581
# doubles(10, 100) => 0.6832948559787737
# Notes:
# In u(1, N) the dot is the multiplication operator.
# Don't truncate or round: Have a look at the testing function in "Sample Tests".
# link to symbol Sigma

#===============================================================================================================
#                                               Solution
#===============================================================================================================

N = (1..100000).map{|n| 1 / (n**2 + 2*n + 1).to_f}
KN = (1..100).map{|k| N.map{|n| n**k}}

def doubles(maxk, maxn)
  return (1..maxk).sum{|k| (1..maxn).sum{|n| N[n-1]**k } / k.to_f } if maxk > 100
  (1..maxk).sum{|k| KN[k-1][0...maxn].sum / k.to_f }
end
