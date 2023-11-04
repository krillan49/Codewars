#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write
#
# function repeating_fractions(numerator, denominator)
# that given two numbers representing the numerator and denominator of a fraction, return the fraction in string format. If the fractional part has repeated digits, replace those digits with a single digit in parentheses.
#
# For example:
#
# repeating_fractions(1,1) === '1'
# repeating_fractions(1,3) === '0.(3)'
# repeating_fractions(2,888) === '0.(0)(2)5(2)5(2)5(2)5(2)5(2)'

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def repeating_fractions(numerator, denominator)
  res = (numerator.to_f / denominator).to_s.split('.')
  res[1] = res[1].chars.slice_when{|a, b| a != b}.map{|a| a.size > 1 ? "(#{a[0]})" : a[0]}.join
  res.join('.')
end
