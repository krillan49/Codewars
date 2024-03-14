#===============================================================================================================
#                                               Description
#===============================================================================================================

# Imagine that we have ATM with multiple currencies. The users can withdraw money of in any currency that the ATM has.
#
# Our function must analyze the currency and value of what the users wants, and give money to the user starting from bigger values to smaller. The ATM gives the least amount of notes possible.
#
# This kata has a preloaded dictionary of possible bank note values for different currencies (RUB, EUR, UAH, USD, CUP, SOS):
#
# VALUES = { "EUR" => [5, 10, 20, 50, 100, 200, 500], "USD" => ... }
# The function should return a string containing how many bank notes of each value the ATM will give out, for example:
#
# "8 * 100 USD, 2 * 20 USD, 1 * 2 USD"
# If it can't do that because there are no notes for this value, it should return:
#
# "Can't do *value* *currency*. Value must be divisible by *amount*!"
# (replace *value*, *currency* and *amount* with the relevant details)
#
# If it doesn't have the requested currency at all, it should return:
#
# "Sorry, have no *currency*."
# Notes:
# Letter case and word order doesn't matter in the input: e.g. "EUR 1000" and "1000eur" are the same. See test cases for more user input samples.
# Do not create your own VALUES dictionary/hash or you'll get broken tests.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def atm(value)
  new = value.tr(' ', '')
             .chars
             .slice_when{|a, b| (/[a-z]/i === a && /[0-9]/i === b) or (/[a-z]/i === b && /[0-9]/i === a)}
             .map(&:join)
             .sort
  val = new[1].upcase
  VALUES[val] ? v = VALUES[val] : (return "Sorry, have no #{val}.")
  sum = new[0].to_i
  return "Can't do #{sum} #{val}. Value must be divisible by #{v[0]}!" if sum % v[0] != 0
  v.reverse.each_with_object([]) do |n, a|
    if sum / n > 0
      a << "#{sum/n} * #{n} #{val}"
      sum -= sum / n * n
    end
  end.join(', ')
end
