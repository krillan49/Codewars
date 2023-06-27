#===============================================================================================================
#                                               Description
#===============================================================================================================

# This kata is inspired by Project Euler Problem #387
#
# Description
# A Harshad number (or Niven number) is a number that is divisible by the sum of its digits. A right truncatable Harshad number is any Harshad number that, when recursively right-truncated, results in a Harshad number at each truncation. By definition, 1-digit numbers are not right truncatable Harshad numbers.
#
# For example 201 (which is a Harshad number) yields 20, then 2 when right-truncated, which are all Harshad numbers. Thus 201 is a right truncatable Harshad number.
#
# Your task
# Given a range of numbers (a..b, both included), return the list of right truncatable Harshad numbers in this range.
#
# Note: there are 500 random tests, with 0 <= a <= b <= 1016
#
# Examples
# 0, 20        -->  [10, 12, 18, 20]
# 30, 100      -->  [30, 36, 40, 42, 45, 48, 50, 54, 60, 63, 70, 72, 80, 81, 84, 90, 100]
# 90, 200      -->  [90, 100, 102, 108, 120, 126, 180, 200]
# 200, 210     -->  [200, 201, 204, 207, 209, 210]
# 1000, 2000   -->  [1000, 1002, 1008, 1020, 1026, 1080, 1088, 1200, 1204, 1206, 1260, 1800, 2000]
# 2200, 2300   -->  []
# 9000002182976, 9000195371842  -->  [9000004000000, 9000004000008]

#===============================================================================================================
#                                               Solution
#===============================================================================================================

phr = {1 => [1,2,3,4,5,6,7,8,9]}
(2..16).each do |i|
  phr[i-1].each do |n|
    (0..9).each do |e|
      new = (n.to_s + e.to_s).to_i
      if new % (n.digits.sum + e) == 0
        phr[i] ? phr[i] << new : phr[i] = [new]
      end
    end
  end
end
$phr = phr.values.flatten

def rthn_between(a, b)
  $phr.select{|e| e >= 10 && e >= a && e <= b}
end
