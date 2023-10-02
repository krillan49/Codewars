#===============================================================================================================
#                                               Description
#===============================================================================================================

# We have a distribution of probability of a discrete variable (it may have only integer values)
#
# x       P(x)
# 0       0.125
# 1       0.375
# 2       0.375
# 3       0.125
# Total = 1.000   # The sum of the probabilities for all the possible values should be one (=1)
# The mean, μ, of the values of x is:
#
# https://imgur.com/EbDq0XT
#
# For our example
#
# μ = 0*0.125 + 1*0.375 + 2*0.375 + 3*0.125 = 1.5
# The variance, σ² is:
#
# https://imgur.com/vMyeQEn
#
# For our example :
#
# σ² = 0.75
# The standard deviation, σ is:
#
# https://imgur.com/mg801Vq
#
# Finally, for our example:
#
# σ = 0.8660254037844386
# Make the function stats_disc_distr() that receives a 2D array. Each internal array will have a pair of values: the first one, the value of the variable x and the second one its correspondent probability, P(x).
#
# For the example given above:
#
# stats_disc_distr([[0, 0.125], [1, 0.375], [2, 0.375], [3, 0.125]]) == [1.5, 0.75, 0.8660254037844386]
# The function should check also if it is a valid distribution.
#
# If the sum of the probabilities is different than 1, the function should output an alert.
#
# stats_disc_distr([[0, 0.425], [1, 0.375], [2, 0.375], [3, 0.125]]) == "It's not a valid distribution"
# If one of the values of x is not an integer, the function will give a specific alert:
#
# stats_disc_distr([[0.1, 0.425], [1.1, 0.375], [2, 0.375], [3, 0.125]]) == "All the variable values should be integers"
# If the distribution has both problems will output another specific alert:
#
# stats_disc_distr([[0.1, 0.425], [1.1, 0.375], [2, 0.375], [3, 0.125]]) == "It's not a valid distribution and furthermore, one or more variable value are not integers"
# But if a value is a float with its decimal part equals to 0 will proceed without inconveniences, (if the sum of probabilities is 1:
#
# stats_disc_distr([[0.0, 0.125], [1.0, 0.375], [2.0, 0.375], [3, 0.125]]) == [1.5, 0.75, 0.8660254037844386]
# The 2Darray will not have any strings.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def stats_disc_distr(distrib)
  any_float, sum_not_1 = distrib.any?{|a| a[0] % 1 != 0}, distrib.map{|a| a[1]}.sum != 1
  return "It's not a valid distribution and furthermore, one or more variable value are not integers" if any_float && sum_not_1
  return 'All the variable values should be integers' if any_float
  return "It's not a valid distribution" if sum_not_1
  m = distrib.map{|a, b| a * b}.sum
  v = distrib.map{|a, b| (a - m)**2 * b}.sum
  [m, v, Math.sqrt(v)]
end
