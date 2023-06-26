#===============================================================================================================
#                                               Description
#===============================================================================================================

# This Kata is based on the SMBC Comic on fourier transformations (2874). (click on the comic to go to the website)
#
# A fourier transformation on a number is one that converts the number to a base in which it has more 4s ( 10 in base 6 is 14, which has 1 four as opposed to none, hence, fourier in base 6 ).
#
# A number's fouriest transformation converts it to the base in which it has the most 4s.
# For example: 35353 is the fouriest in base 6: 431401.
#
# This kata requires you to create a method fouriest that takes a number and makes it the fouriest, telling us in which base this happened, as follows:
#
# fouriest(number) -> "#{number} is the fouriest (#{fouriest_representation}) in base #{base}"
# Important notes
# For this kata we don't care about digits greater than 9 ( only 0 to 9 ), so we will represent all digits greater than 9 as 'x': 10 in base 11 is 'x', 119 in base 20 is '5x', 118 in base 20 is also '5x'
#
# When a number has several fouriest representations, we want the one with the LOWEST base
#
# Examples
# "30 is the fouriest (42) in base 7"
# "15 is the fouriest (14) in base 11"

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# There is one error in the tests with the number 44, just restart if you get it.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def translator_from10_to_any(n, base)
  res = []
  until n == 0
    res.unshift(n % base)
    n /= base
  end
  res
end

def fouriest(n)
  res = [0, 0, 0]
  5.upto(2000) do |base|
    sn = translator_from10_to_any(n, base).map{|i| i < 10 ? i : 'x'}.join
    num = sn.count('4')
    res = [sn, base, num] if num > res[2]
    break if sn.size <= res[2] or sn == 'x'
  end
  "#{n} is the fouriest (#{res[0]}) in base #{res[1]}"
end
