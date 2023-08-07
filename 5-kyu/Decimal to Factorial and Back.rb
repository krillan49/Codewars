#===============================================================================================================
#                                               Description
#===============================================================================================================

# Coding decimal numbers with factorials is a way of writing out numbers in a base system that depends on factorials, rather than powers of numbers.
#
# In this system, the last digit is always 0 and is in base 0!. The digit before that is either 0 or 1 and is in base 1!. The digit before that is either 0, 1, or 2 and is in base 2!, etc. More generally, the nth-to-last digit is always 0, 1, 2, ..., n and is in base n!.
#
# Read more about it at: http://en.wikipedia.org/wiki/Factorial_number_system
#
# Example
# The decimal number 463 is encoded as "341010", because:
#
# 463 = 3×5! + 4×4! + 1×3! + 0×2! + 1×1! + 0×0!
#
# If we are limited to digits 0..9, the biggest number we can encode is 10!-1 (= 3628799). So we extend 0..9 with letters A..Z. With these 36 digits we can now encode numbers up to 36!-1 (= 3.72 × 1041)
#
# Task
# We will need two functions. The first one will receive a decimal number and return a string with the factorial representation.
#
# The second one will receive a string with a factorial representation and produce the decimal representation.
#
# Given numbers will always be positive.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

FACT = (1..35).map{|e| (1..e).inject(:*)}
NUMS = ('A'..'Z').map.with_index{|l, i| [i+10, l]}.to_h

def dec_2_fact_string(nb)
  n = FACT.reverse.find{|e| e < nb}
  res = ''
  FACT[0..FACT.index(n)].reverse.each do |e|
    res += nb / e > 9 ? NUMS[nb/e] : "#{nb/e}"
    nb %= e
  end
  res + '0'
end

def fact_string_2_dec(str)
  str[0..-2].chars.reverse.map{|e| /[0-9]/ === e ? e.to_i : NUMS.key(e)}.zip(FACT).map{|a| a[0] * a[1]}.sum
end
