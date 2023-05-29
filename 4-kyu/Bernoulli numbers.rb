#===============================================================================================================
#                                               Description
#===============================================================================================================

# https://en.wikipedia.org/wiki/Bernoulli_number
#
# http://mathworld.wolfram.com/BernoulliNumber.html
#
# Exercise
# Your job is to write a function bernoulli_number(n) which outputs the n-th Bernoulli number. The input will always be a non-negative integer so you do not need to worry about exceptions. How you will solve the problem is none of my business but here are some guidelines.
# You can make pascal triangle and then with the basic formula generate all Bernoulli numbers. Look example below.
#
# For the sake of floating numbers, just use Fractions so there will be no problems with rounding.
#
# 0 = 1 + 2b1 ............................................................... b1 = - 1/2
#
# 0 = 1 + 3b1 + 3b2 ................................................... b2 = 1/6
#
# 0 = 1 + 4b1 + 6b2 + 4b3 ....................................... b3 = 0
#
# 0 = 1 + 5b1 + 10b2 + 10b3 + 5b4 ...................... b4 = - 1/30
#
# ... and so on.
#
# bernoulli_number(0) # return 1
# bernoulli_number(1) # return Fraction(-1,2) or Rational(-1,2) or "1/2"
# bernoulli_number(6) # return Fraction(1,42) or ...
# bernoulli_number(42) # return Fraction(1520097643918070802691,1806) or ...
# bernoulli_number(22) # return Fraction(854513,138) or ... "854513/138"
# Note
# See "Sample Tests" to see the return type for each language.
#
# Good luck and happy coding!
#
# PS: be careful some numbers might exceed 1000. If this kata is too hard for you try to solve pascal triangle and something similar to this and then come back :).

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# 1. Use Rational class

# 2. the binomial coefficient is useful for solving

# 3. All odd Bernoulli numbers from 3 and up are 0

# 4. Memorization can help

#===============================================================================================================
#                                               Solution
#===============================================================================================================

B = {0 => '1'.to_r, 1 => '-1/2'.to_r}
3.step(9999,2){|e| B[e] = 0}

def bin_coef(n, k)
  (1..n).inject(:*) / ((1..k).inject(:*) * ((1..n-k).inject(:*) || 1))
end

2.step(300,2) do |n|
  res = (1..n).map{|k| "#{bin_coef(n+1, k+1)}".to_r * B[n-k] }.sum
  bn = "#{-1}".to_r / "#{n+1}".to_r * res
  B[n] = bn
end

def bernoulli_number(n)
  B[n]
end
