#===============================================================================================================
#                                               Description
#===============================================================================================================

# In the web we have many available colours that we may use with html. The different variations or arrangements, for a design in the web may climb up if we increase the amount of used colours, specially because the order matters for the different designs.
#
# An "expert" uses a formula that relates the amount of designs with the number of colours, and even though he has a developed intiution, his results are not exact. We explain the problem to you and see if you can help.
#
# Let's see the amount of arrangements of colours that we may produce with the set: red, yellow, blue.
#
# red
# yellow
# blue
#
# redyellow
# yellowred
# redblue
# bluered
# yellowblue
# blueyellow
#
# redyellowblue
# redblueyellow
# yellowredblue
# yellowbluered
# blueredyellow
# blueyellowred
#
# We have a total of 15 arrangements. Six, will be the minimum value for the unique colours set size that surpasses the amount of 1.000 arrangements or variations.
#
# Task
# Given an integer, limit, and an array with different and unique colours, cols, make a code that may calculate:
#
# the minimum size the set should have so that it generates more arrangements than the limit value, limit
#
# the number of variations that we may obtain with the current set, cols    .
#
# This pair of values should output in an array.
#
# See sample cases in the examples box.
#
# Features of the random tests:
# 0 <= limit <= 10**150
# 0 <= amount_of_colours < 100
# Number of random tests: 90
#
# Have a good and productive time! (Performance matters)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

LIMS = (0..100).map{|n| (1..n).map{|k| (1..n).inject(:*) / (n == k ? 1 : (1..n-k).inject(:*))}.sum}

def total_var(limit, cols)
  [LIMS.index{|e| e > limit}, LIMS[cols.size]]
end
