#===============================================================================================================
#                                               Description
#===============================================================================================================

# In mathematics, any of the positive integers that occurs as a coefficient in the binomial theorem is a binomial coefficient. Article.
#
# Commonly, a binomial coefficient is indexed by a pair of integers n >= k >= 0 and is written (n 'over' k). This notation is read as "from n choose k".
#
# The formula is described simply, here.
#
# An interesting fact about the binomial theorem is that the binomial coefficients can be arranged to form Pascal's triangle. They can also be used to describe properties of N dimensional hypercubes. Here's a cool video talking about that.
#
# Challenge
# Your task is to augment the Integer class to give integers a choose method so that you may write 10.choose 4 and return the number of combinations. e.g. 10.choose(4) == 210. You will find enough information to solve this challenge in the links above.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Integer
  def choose(k)
    (1..self).inject(:*) / ((1..k).inject(:*) * (1..self-k).inject(:*))
  end
end
