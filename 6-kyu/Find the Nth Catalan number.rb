#===============================================================================================================
#                                               Description
#===============================================================================================================

# What is a Catalan number?
# In combinatorial mathematics, the Catalan numbers form a sequence of natural numbers that occur in various counting problems, often involving recursively-defined objects. They are named after the Belgian mathematician Eugène Charles Catalan (1814–1894).
#
# Using zero-based numbering, the nth Catalan number is given directly in terms of binomial coefficients by:
#
# https://wikimedia.org/api/rest_v1/media/math/render/svg/dbc424e9c15a763d9bdd8b096cec7138993dad4a
#
# You can read more on Catalan numbers Here.
#
# Task:
# Implement a function which calculates the Nth Catalan number.
#
# 0  =>  1
# 3  =>  5
# 7  =>  429
# 9  =>  4862
# Hint: avoid the use of floats

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def catalan_number(n)
  return 1 if n == 0
  (1..2*n).inject(:*) / ( (1..n+1).inject(:*) * (1..n).inject(:*) )
end
