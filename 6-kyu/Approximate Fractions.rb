#===============================================================================================================
#                                               Description
#===============================================================================================================

# We want to obtain number π (π = 3,1415926535897932384626433832795) with an approximate fraction having a relative error of 1%
#
# rel_error = (π - fraction_value) / π * 100 = ± 1
# absolute_error = |± 1 / 100 * π| = 0.031416
# Try to get the used algorithm to obtain the approximate fraction, observing the process bellow:
#
# 1/1 -----> 2/1 -----> 3/1 -----> 4/1 -----> 4/2 -----> 5/2 -----> 6/2 -----> 7/2 -----> 7/3 -----> 8/3 -----> 9/3 -----> 10/3 ----> 10/4 ----> 11/4 ----> 12/4 ----> 13/4 ----> 13/5 ----> 14/5 ----> 15/5 ----> 16/5 ----> 16/6 ----> 17/6 ----> 18/6 ----> 19/6
# |π - 19/6| = 0.02 < 0.031416
#
# So we obtain the fraction 19/6 (approximate to π) in 23 steps.
#
# Make the function approx_fraction(), that receives a float (an irrational number) and a relative error (as percentage) as arguments. The function should output a list with the fraction as a string and the number of steps needed.
#
# Let's see some cases:
#
# float_ = math.pi
# rel_error = 1
# approx_fraction(float_, rel_error) == ['19/6', 23]
#
# float_ = math.pi
# rel_error = 0.01
# approx_fraction(float_, rel_error) ==  ['289/92', 379]
# Your code should handle negative floats.
#
# degrees = 130
# float_ = math.cos(math.pi*degrees/180) # (= -0.6427876096865394)
# rel_error = 0.001
# approx_fraction(float_, rel_error) == ['-610/949', 1557]
# If the float number does not have a decimal part, like this case:
#
# float_ = math.sqrt(361) #(= 19)
# rel_error = 0.01
# approx_fraction(float_, rel_error) == "There is no need to have a fraction for 19"
#
# float_ = math.log(1)
# rel_error = 0.01
# approx_fraction(float_, rel_error) == "There is no need to have a fraction for 0"
# Finally if the absolute difference with the given float and its integer part is less than 0.0000000001 (1* 10^-10), consider it as an integer
#
# degrees = 45
# float_ = math.tan(math.pi*degrees/180) # (= 0.9999999999999999)
# rel_error = 0.01
# approx_fraction(float_, rel_error) == "There is no need to have a fraction for 1"
# As irrational numbers, you will be given: 10-base logarithms, natural logarithms, trigonometric functions, square roots and nth-roots of numbers.
#
# Do not worry about values like ± ∞ (positive, negative infinity) or complex numbers. For python: There is no need to import the math library.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def approx_fraction(x, rel_error)
  return "There is no need to have a fraction for #{x.to_i}" if x % 1 == 0
  error = (rel_error / 100.0 * x).abs
  numerator, denominator = 1, 1
  counter = 0
  until (x.abs - numerator.to_f / denominator).abs < error
    if numerator.to_f / denominator < x.abs
      numerator += 1
    elsif numerator.to_f / denominator > x.abs
      denominator += 1
    end
    counter += 1
  end
  numerator *= -1 if x < 0
  return "There is no need to have a fraction for #{numerator / denominator}" if (numerator / denominator.to_f) % 1 == 0
  ["#{numerator}/#{denominator}", counter]
end
