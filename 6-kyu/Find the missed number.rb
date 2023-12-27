#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this kata, you will be given a string containing numbers from a to b, one number can be missing from these numbers, then the string will be shuffled, you're expected to return an array of all possible missing numbers.
#
# Examples (input => output)
# Here's a string with numbers from 1 - 21, its missing one number and the string is then shuffled, your'e expected to return a list of possible missing numbers.
#
# 1, 21, "2198765123416171890101112131415"  => [ 12, 21 ]
# You won't be able to tell if its 21 or 12, you must return all possible values in an array.
#
# Another Example
# 5, 10, "578910" => [ 6 ]
# Documentation:
# The parameters will be in order two numbers and a string:
#
# start => from
# stop => to
# string => numbers from start to stop in string form (shuffled), but missing one number
# Note:
#
# if there're no missing numbers return an empty list

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find_number(start, stop, string)
  hnum = string.chars.tally
  hall = (start.to_s..stop.to_s).to_a.join.chars.tally
  res = hall.merge(hnum){|k, o_v, n_v| o_v - n_v }.map{|k, v| k * v}.join
  return [] if res == ''
  res.chars.permutation(res.to_s.size).map{|a| a.join.to_i}.uniq.sort.reject{|e| e.to_s.size != res.size || e < start || e > stop}
end
